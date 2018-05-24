(use-package esh-mode
  :init
  (setq eshell-save-history-on-exit t)

  ;; make the input history more bash-like
  (setq eshell-hist-ignoredups t)
  (setq eshell-cmpl-cycle-completions nil)
  
  ;; scroll to the bottom
  (setq eshell-scroll-to-bottom-on-output t)
  (setq eshell-scroll-show-maximum-output t)

  :config
  (setq eshell-path-env
	(concat (getenv "PATH") path-separator eshell-path-env)))

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

;; setup PATH
(setq eshell-path-env
      (concat (getenv "PATH") path-separator eshell-path-env))
