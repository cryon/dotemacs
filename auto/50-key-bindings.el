;; move text up
(global-set-key
 (kbd "M-<up>")
 'move-text-up)

;; move text down
(global-set-key
 (kbd "M-<down>")
 'move-text-down)

;; ibuffer is way cooler than buffer menu
(global-set-key
 (kbd "C-x C-b")
 'ibuffer)

;; align-regexp is cool
(global-set-key
 (kbd "C-x a")
 'align-regexp)

;; replace-regexp deserves a better bind than C-M-%
(global-set-key
 (kbd "C-c r")
 'replace-regexp)

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

;; Adds a cursor at the next occurance of whats in the current region
(global-set-key
 (kbd "C-ä")
 'mc/mark-next-like-this)

;; Use smex for M-x
(global-set-key
 (kbd "M-x")
 'smex)

;; Navigate between windows... Quake style (wasd)
(global-set-key (kbd "C-S-a") 'windmove-left)
(global-set-key (kbd "C-S-d") 'windmove-right)
(global-set-key (kbd "C-S-w") 'windmove-up)
(global-set-key (kbd "C-S-s") 'windmove-down)

;; company-mode
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; if there's anything outside of emacs, I don't want to know.
(global-set-key [f12] 'toggle-frame-fullscreen)

;; highlight symbol
(global-set-key (kbd "C-å") 'highlight-symbol)
(global-set-key (kbd "C-Å")  'highlight-symbol-query-replace)

;; idomenu
(global-set-key (kbd "M-i") 'idomenu)
