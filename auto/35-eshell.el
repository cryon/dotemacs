(require 'esh-mode)

(setq eshell-save-history-on-exit t)

;; make the input history more bash-like
(setq eshell-hist-ignoredups t)
(setq eshell-cmpl-cycle-completions nil)

;; scroll to the bottom
(setq eshell-scroll-to-bottom-on-output t)
(setq eshell-scroll-show-maximum-output t)
(add-to-list 'eshell-output-filter-functions
             'eshell-postoutput-scroll-to-bottom)

;; use ansi-term for these commands
(add-hook
 'eshell-first-time-mode-hook
 (lambda ()
   (setq eshell-visual-commands
	 (append
	  '("screen" "telnet" "ssh")
	  eshell-visual-commands))))

;; clear - clears the buffer
(defun eshell/clear ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; emacs file - opens file
(defun eshell/emacs (file)
  (find-file file))

;; magit - runs magit-status in current directory
(defun eshell/magit ()
  (call-interactively 'magit-status))
