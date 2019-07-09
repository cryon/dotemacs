(let ((dirs '("/usr/bin"
	      "/bin"
	      "/usr/sbin"
	      "/sbin"
	      "/usr/local/bin"
	      "/usr/X11/bin"
	      "/opt/local/bin"
	      "/opt/local/sbin"
              "/Users/john.olsson/bin"
	      "/Users/john.olsson/.cargo/bin")))
  (setenv "PATH" (mapconcat 'identity dirs path-separator))
  (setenv "LIBRARY_PATH" "/usr/local/lib")
  (setenv "LC_CTYPE" "en_US.UTF-8")
  (setenv "LC_ALL" "en_US.UTF-8")


  (setq exec-path (append exec-path dirs)
        ispell-program-name "aspell"
        ispell-dictionary "american"))
