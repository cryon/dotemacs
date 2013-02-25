(let ((hostname (downcase (car (split-string system-name "\\.")))))
  (when (string-match hostname "elrond")
    (setenv "PATH"
	    (concat
	     "/Users/john/bin:"
	     "/usr/bin:"
	     "/bin:"
	     "/usr/sbin:"
	     "/sbin:"
	     "/usr/local/bin:"
	     "/usr/local/git/bin:"
	     "/usr/X11/bin:"
	     "/opt/local/bin:"
	     "/opt/local/sbin:"
	     "/usr/local/share/npm/bin:"
	     "/Users/john/.cabal/bin"))

    (setenv "GHC_MOD"
	    "/Users/john/.cabal/share/ghc-mod-1.11.4/")

    (setq haskell-program-name "/usr/local/bin/ghci")))
