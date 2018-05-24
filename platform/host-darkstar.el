(let ((dirs '("/usr/bin"
	      "/bin"
	      "/usr/sbin"
	      "/sbin"
	      "/usr/local/bin"
	      "/usr/X11/bin"
	      "/opt/local/bin"
	      "/opt/local/sbin"
              "/Users/john/bin")))
  (setenv "PATH" (mapconcat 'identity dirs path-separator))
  (setenv "LIBRARY_PATH" "/usr/local/lib")

  (setq exec-path (append exec-path dirs)
        ispell-program-name "aspell"
        ispell-dictionary "american"))
