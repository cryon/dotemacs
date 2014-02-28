;; scroll up
(global-set-key
 (kbd "S-<up>")
 (lambda()
   (interactive)
   (scroll-down 1)
   (previous-line 1)))

;; scroll down
(global-set-key
 (kbd "S-<down>")
 (lambda()
   (interactive)
   (scroll-up 1)
   (next-line 1)))

;; move text up
(global-set-key
 (kbd "M-<up>")
 'move-text-up)

;; move text down
(global-set-key
 (kbd "M-<down>")
 'move-text-down)

;; expand region
(global-set-key
 (kbd "S-M-<up>")
 'er/expand-region)

;; contract region
(global-set-key
 (kbd "S-M-<down>")
 'er/contract-region)

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

;; Velfolt says it's cool to jump between hunks. I agree.
(global-set-key
 (kbd "M-n")
 'git-gutter:next-hunk)

(global-set-key
 (kbd "M-p")
 'git-gutter:previous-hunk)
