(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (setq show-trailing-whitespace 1)
	    (when window-system
	      (hl-line-mode)
	      (rainbow-mode))))
