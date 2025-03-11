(defun cryon/gen-time-sheet (year month)
  "Creates a time sheet for a month formatted as Markdown"
  (interactive
   (list
    (read-number "Year: " (nth 5 (decode-time (current-time))))
    (read-number "Month: " (nth 4 (decode-time (current-time))))))
  (let ((month-name (format-time-string "%B" (encode-time 0 0 0 1 month 2525))))
    (insert "# Time sheet: " month-name " " (number-to-string year) "\n\n"))
  (--cryon/gen-month-table year month))

(defun --cryon/gen-month-table (year month)
  (let ((total-hours 0)
        (day 1)
        (time (encode-time 0 0 0 1 month year)))
    (insert "|Date       |Hours|Comment|\n|-----------|-----|--------|\n")
    (while (= (nth 4 (decode-time time)) month)
      (let* ((weekday (nth 6 (decode-time time)))
             (weekend (or (= weekday 0) (= weekday 6)))
             (hours (if weekend "-" "8")))
        (unless weekend
          (setq total-hours (+ total-hours 8)))
        (insert (format "|%s|%s|  |\n"
                        (format-time-string "%Y-%m-%d" time) hours)))
      (setq time (encode-time 0 0 0 (setq day (1+ day)) month year)))
    (insert "|-----------|-----|--------|\n")
    (insert (format "|Total Hours|%d|  |\n" total-hours))
    (save-excursion
      (previous-line)
      (markdown-table-align))))

(defun cryon/sum-column-above ()
  "Sums the column above and replace the content of the current cell with that sum"
  (interactive)
  (when (not (markdown-table-at-point-p))
    (user-error "Point is not in a markdown table"))

  (let ((col (markdown-table-get-column))
	(end-line (line-number-at-pos))
	(sum 0))

    (save-excursion
      (goto-char (markdown-table-begin))

      (while (not (= (line-number-at-pos) end-line))
	(let* ((cell-content (markdown-table-get-cell col))
	       (numeric-value (string-to-number cell-content)))
	  (when (not (equal numeric-value 0.0))
            (setq sum (+ sum numeric-value)))
	  (next-line)))

      (save-excursion
	(search-backward-regexp "|")
	(forward-char)
	(kill-word 1)
	(insert (number-to-string sum))
	(markdown-table-align)))))





;; (defun cryon/current-cell-content ()
;;   (save-excursion
;;     (let (cell-content)
;;       (re-search-backward "|" nil t)
;;       (forward-char)
;;       (when (re-search-forward "\\([^|]+\\)|" nil t)
;;         (setq cell-content (match-string 1)))
;;       (string-trim cell-content))))

;; (defun cryon/sum-column-above ()
;;   ""
;;   (interactive)

;;   (defun is-delimiter-p (s)
;;     (string-match-p "^--+$" s))

;;   (save-excursion
;;     ;; Todo: We're currently assuming that we're in a markdown table

;;     ;; Move to the start of cell
;;     (re-search-backward "|" nil t)
;;     (forward-char)

;;     (save-excursion
;;       ;; If the cell directly above the
;;       (previous-line)
;;       (markdown-table
;;       (let ((col (current-column))
;; 	    (cell-content (cryon/current-cell-content))
;; 	    (sum 0))

;; 	(while cell-content



;;       (save-excursion
;; 	;; Move upwards until we hit a delimiter, unless it's the row
;; 	;; right before. Then we just continue until the next delimiter.
;; 	(while (cell-content
;; 	  (previous-line)
;; 	  (move-to-column col)
;; 	  (setq sum (+ sum (string-to-number (cryon/current-cell-content))))))

;;       (kill-word 1)
;;       (insert (num-to-string sum))
;;       (markdown-table-align))))
