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
      (setq exec-path (append exec-path dirs))

      (setenv
       "GHC_MOD"
       "~/.cabal/share/x86_64-osx-ghc-7.8.2/ghc-mod-4.1.0"))))
