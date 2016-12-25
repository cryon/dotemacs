(let ((hostname (downcase (car (split-string system-name "\\.")))))
  (when (string-match hostname "darkstar")
    (let ((dirs '("/usr/bin"
		  "/bin"
		  "/usr/sbin"
		  "/sbin"
		  "/usr/local/bin"
		  "/usr/X11/bin"
		  "/opt/local/bin"
		  "/opt/local/sbin"
                  "/Users/john/.cabal/bin"
                  "/Users/john/bin"
                  "/Users/john/code/thirdparty/scala-2.11.7/bin")))
      (setenv "PATH" (mapconcat 'identity dirs path-separator))

      (setenv "LIBRARY_PATH" "/usr/local/lib")

      (setenv "SCALA_HOME"
              "/Users/john/code/thirdparty/scala-2.11.7")

      (setq exec-path (append exec-path dirs)))))
