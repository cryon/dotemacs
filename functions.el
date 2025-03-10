(defun cryon/gen-time-sheet (year month)
  "Creates a time sheet for a month formatted as Markdown"
  (interactive
   (list
    (read-number "Year: " (nth 5 (decode-time (current-time))))
    (read-number "Month: " (nth 4 (decode-time (current-time))))))
  (let ((month-name (format-time-string "%B" (encode-time 0 0 0 1 month 2525))))
    (insert "# Time sheet: " month-name " " (number-to-string year) "\n\n"))
  (cryon/gen-month-table year month))

(defun cryon/gen-month-table (year month)
  "Create a markdown table for every day of the given YEAR and MONTH."
  (insert "|Date|Hours|Comment|\n|---\n")
  (let ((day 1)
        (time (encode-time 0 0 0 1 month year)))
    (while (= (nth 4 (decode-time time)) month)
      (let ((weekday (nth 6 (decode-time time))))
        (when (and (= weekday 1) (> day 1))
          (insert "|---\n"))
        (insert (format "|%s|%s|  |\n"
                        (format-time-string "%Y-%m-%d" time)
                        (if (or (= weekday 0) (= weekday 6)) "-" "8"))))
      (setq time (encode-time 0 0 0 (setq day (1+ day)) month year))))
  (previous-line)
  (markdown-table-align))
