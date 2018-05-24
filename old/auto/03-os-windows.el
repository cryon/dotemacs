(let ((system-string (symbol-name system-type)))
  (when (or
         (string-match "windows" system-string)
         (string-match "cygwin" system-string))
    (set-frame-font "Source Code Pro-11" nil t)))
