(defun md-timesheet/generate (year month)
  "Creates a time sheet for a month formatted as Markdown"
  (interactive
   (list
    (read-number "Year: " (nth 5 (decode-time (current-time))))
    (read-number "Month: " (nth 4 (decode-time (current-time))))))
  (let ((month-name (format-time-string "%B" (encode-time 0 0 0 1 month 2525))))
    (insert "# Time sheet: " month-name " " (number-to-string year) "\n\n"))
  (--generate-month-table year month))

(defun --generate-month-table (year month)
  (markdown-insert-table 1 3 'left)
  (insert "Date")    (markdown-table-forward-cell)
  (insert "Hours")   (markdown-table-forward-cell)
  (insert "Comment") (markdown-table-forward-cell)
  (insert "-")       (markdown-table-next-row)

  (let ((total-hours 0)
	(day 1)
	(time (encode-time 0 0 0 1 month year)))
    (while (= (nth 4 (decode-time time)) month)
      (let* ((day-of-week (nth 6 (decode-time time)))
	     (is-weekend (or (= day-of-week 0) (= day-of-week 6)))
	     (hours (if is-weekend 0 8)))

	(when (or (= day-of-week 1) (= day 1))
	  (when (not (= day 1))
	    (insert "-")
	    (markdown-table-next-row))

	  (insert (format-time-string "Week %V" time))
	  (markdown-table-next-row)
	  (markdown-table-next-row))

	(setq total-hours (+ total-hours hours))

	(insert (format-time-string "%Y-%m-%d %a" time))
	(markdown-table-forward-cell)

	(insert (if (= 0 hours) "-" (number-to-string hours)))
	(markdown-table-forward-cell)
	(markdown-table-forward-cell)
	(setq time (encode-time 0 0 0 (setq day (1+ day)) month year))))

    (insert "-")
    (markdown-table-next-row)
    (insert "Total hours")
    (markdown-table-forward-cell)
    (insert (number-to-string total-hours))
    (markdown-table-align)))

(defun md-timesheet/sum-hours ()
  "Calculate the total number of hours in the timesheet"
  (interactive)
  (when (not (markdown-table-at-point-p))
    (user-error "Point is not in a markdown table"))

  (save-excursion
    (markdown-table-goto-dline 2)
    (markdown-table-goto-column 2)

    (let ((total-hours 0)
	  (last-row (line-number-at-pos (markdown-table-end))))
      (while (not (= (line-number-at-pos) (- last-row 1)))
	(let* ((cell-content (markdown-table-get-cell 2))
	       (numeric-value (string-to-number cell-content)))
	  (when (not (equal numeric-value 0.0))
            (setq total-hours (+ total-hours numeric-value)))
	  (next-line)))

      (kill-word 1)
      (insert (number-to-string total-hours))
      (markdown-table-align))))
