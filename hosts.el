(let ((hostname (downcase (car (split-string system-name "\\.")))))
  (when (string-match hostname "elrond")
    (let ((dirs '("/Users/john/bin"
		  "/usr/bin"
		  "/bin"
		  "/usr/sbin"
		  "/sbin"
		  "/usr/local/bin"
		  "/usr/local/git/bin"
		  "/usr/X11/bin"
		  "/opt/local/bin"
		  "/opt/local/sbin"
		  "/usr/local/share/npm/bin"
		  "/Users/john/.cabal/bin")))
      (setenv "PATH" (mapconcat 'identity dirs path-separator))
      (setq exec-path (append exec-path dirs)))

    (setenv "GHC_MOD"
	    "/Users/john/.cabal/share/ghc-mod-1.11.4/")

    (setq haskell-program-name "ghci")))
