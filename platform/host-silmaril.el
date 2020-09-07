(let ((dirs '("/usr/bin"
	      "/bin"
	      "/usr/sbin"
	      "/sbin"
	      "/usr/local/bin"
	      "/usr/X11/bin"
	      "/opt/local/bin"
	      "/opt/local/sbin"
              "/Users/john/bin"
	      "/Users/john/.local/bin"
	      "/Users/john/.sdkman/candidates/java/current/bin"
	      "/Users/john/.cabal/bin"
	      "/USers/john/.ghcup/bin")))
  (setenv "PATH" (mapconcat 'identity dirs path-separator))
  (setenv "LIBRARY_PATH" "/usr/local/lib")

  (setenv "JAVA_HOME" "/Users/john/.sdkman/candidates/java/current")

  (setenv "LC_NUMERIC"  "en_US.UTF-8")
  (setenv "LC_TIME"  "en_US.UTF-8")
  (setenv "LC_COLLATE"  "en_US.UTF-8")
  (setenv "LC_MONETARY"  "en_US.UTF-8")
  (setenv "LC_MESSAGES"  "en_US.UTF-8")

  (setq exec-path (append exec-path dirs)
        ispell-program-name "aspell"
        ispell-dictionary "american"))
