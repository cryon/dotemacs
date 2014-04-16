
(setq haskell-program-name "cabal repl")

(add-hook 'haskell-mode-hook
	  (lambda ()
	    (turn-on-haskell-indentation)
	    (turn-on-haskell-doc-mode)
	    (hl-line-mode)
	    (setq show-trailing-whitespace 1)
	    (setq haskell-process-type 'cabal)))

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(let ((mod (getenv "GHC_MOD")))
  (when mod (add-to-list 'load-path mod)))
