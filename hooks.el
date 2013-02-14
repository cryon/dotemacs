
;; before save
(add-hook 'before-save-hook
	  (lambda ()
	    (delete-trailing-whitespace)))

;; elisp
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (setq show-trailing-whitespace 1)
	    (hl-line-mode)
	    (rainbow-mode)))

;; haskell
(add-hook 'haskell-mode-hook
	  (lambda ()
	    (turn-on-haskell-indentation)
	    (turn-on-haskell-doc-mode)))
