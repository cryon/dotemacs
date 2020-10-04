(use-package xterm-color :ensure t
  :init
  (setenv "TERM" "xterm-256color")
  (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
  (setq comint-output-filter-functions
	(remove 'ansi-color-process-output comint-output-filter-functions)))

(use-package eshell
  :init
  (setq
   eshell-save-history-on-exit t

   ;; make the input history more bash-like
   eshell-hist-ignoredups t
   eshell-cmpl-cycle-completions nil

   ;; scroll to the bottom
   eshell-scroll-to-bottom-on-output t
   eshell-scroll-show-maximum-output t

   eshell-path-env (getenv "PATH"))

  :hook
  ((eshell-pre-command . (lambda () (setq eshell-path-env (getenv "PATH"))))
   (eshell-mode-hook . (lambda () (setq eshell-path-env (getenv "PATH"))))))

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

;; simple but effective prompt
(setq eshell-prompt-regexp "^[^#$\n]*[#$] "
      eshell-prompt-function
      (lambda nil
        (concat
	 ;;"[" (user-login-name) "@" (system-name) " "
	 (if (string= (eshell/pwd) (getenv "HOME"))
	     "~" (eshell/basename (eshell/pwd)))
	 ;;"]"
	 " "
	 (if (= (user-uid) 0) "# " "$ "))))
