;; align-regexp is cool
(global-set-key
 (kbd "C-x a")
 'align-regexp)

;; C-a moves point to the first non whitespace character. If already on
;; first character, move point to the beginning of line
(global-set-key
 (kbd "C-a")
 (lambda ()
   (interactive)
   (let ((oldpos (point)))
     (back-to-indentation)
     (and (= oldpos (point))
	  (beginning-of-line)))))

;; Navigate between windows... Quake style (wasd)
(global-set-key (kbd "C-S-a") 'windmove-left)
(global-set-key (kbd "C-S-d") 'windmove-right)
(global-set-key (kbd "C-S-w") 'windmove-up)
(global-set-key (kbd "C-S-s") 'windmove-down)
