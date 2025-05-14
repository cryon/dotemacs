(global-set-key
 (kbd "C-a")
 (lambda ()
   (interactive)
   (let ((oldpos (point)))
     (back-to-indentation)
     (and (= oldpos (point))
	  (beginning-of-line)))))

(global-set-key
 (kbd "C-x a")
 'align-regexp)

;; Navigate between windows... Quake style (wasd)
(global-set-key (kbd "C-S-a") 'windmove-left)
(global-set-key (kbd "C-S-d") 'windmove-right)
(global-set-key (kbd "C-S-w") 'windmove-up)
(global-set-key (kbd "C-S-s") 'windmove-down)

;; Do not use space to complete words in minibuffer
(define-key minibuffer-local-completion-map (kbd "SPC") nil)
