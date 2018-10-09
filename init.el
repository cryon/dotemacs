;;                        Cryon's Emacs configuration
;;                        ---------------------------

(let ((gc-cons-threshold most-positive-fixnum))

  ;; -- Globals --
  (defvar config-dir (file-name-directory load-file-name))
  (defvar hostname (downcase (car (split-string system-name "\\."))))
  (defvar os (symbol-name system-type))

  (defun load-custom (file)
    (let ((path (concat config-dir file)))
      (when (file-exists-p path)
	(load-file path))))

  (defun load-directory (dir)
    (mapc (lambda (f) (load-file (concat (file-name-as-directory dir) f)))
	  (directory-files dir nil "\\.el$")))

  ;; -- Load custom configurations --
  (load-custom "general.el")
  (load-custom (concat "platform/" "os-" os ".el"))
  (load-custom (concat "platform/" "host-" hostname ".el"))
  (load-custom "packages.el")
  (load-custom "keys.el")
  (load-directory (concat config-dir "auto"))

  ;; -- Last but not least --
  (server-start)
  (cd "~")
  (eshell))
