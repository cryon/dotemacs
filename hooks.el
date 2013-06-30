
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
	    (turn-on-haskell-doc-mode)
	    (hl-line-mode)
	    (setq show-trailing-whitespace 1)
	    (setq haskell-process-type 'cabal-dev)))

(let ((mod (getenv "GHC_MOD")))
  (when mod
    (add-to-list 'load-path mod)
    (autoload 'ghc-init "ghc" nil t)
    (add-hook 'haskell-mode-hook
	      (lambda ()
		(ghc-init)
		(flymake-mode)))))
