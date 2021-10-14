(use-package eshell
  :init
  (setq
   eshell-save-history-on-exit t
   eshell-hist-ignoredups t
   eshell-cmpl-cycle-completions nil
   eshell-scroll-to-bottom-on-input 'all))

(use-package esh-mode
  :config
  (defun eshell/clear ()
    (interactive)
    (eshell/clear-scrollback))

  (defun eshell/emacs (file)
    (find-file file)))
