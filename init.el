;;                        Cryon's Emacs configuration
;;                        ---------------------------

(defvar config-dir (file-name-directory load-file-name))
(defvar hostname (downcase (car (split-string system-name "\\."))))
(defvar os (symbol-name system-type))

(defun cryon--config-path (file)
  "Path to file in config directory"
  (concat config-dir file))

(defun cryon--load-custom (file)
  "Load file relative to the configuration folder"
  (let ((path (cryon--config-path file)))
    (when (file-exists-p path)
      (load-file path))))

(defun cryon--load-directory (dir)
  "Load all .el files in a directory relative to the configuration folder"
  (mapc (lambda (f) (load-file (concat (file-name-as-directory dir) f)))
	(directory-files dir nil "\\.el$")))

(defun cryon--fast-init (init-function)
  "Apply the init function with less overhead"
  (defvar cryon--file-name-handler-alist file-name-handler-alist)
  (setq gc-cons-threshold 402653184
	gc-cons-percentage 0.6
	file-name-handler-alist nil)
  (add-hook
   'emacs-startup-hook
   (lambda ()
     (setq gc-cons-threshold 16777216
	   gc-cons-percentage 0.1
	   file-name-handler-alist cryon--file-name-handler-alist)))
  (funcall init-function))

(defun cryon--init ()
  "The actual init function"
  (cryon--load-custom "general.el")
  (cryon--load-custom (concat "platform/" "os-" os ".el"))
  (cryon--load-custom (concat "platform/" "host-" hostname ".el"))
  (cryon--load-custom "packages.el")
  (cryon--load-custom "keys.el")
  (cryon--load-custom "customizations.el")
  (cryon--load-directory (concat config-dir "auto"))

  (server-start)
  (cd "~")
  (eshell))

(cryon--fast-init 'cryon--init)
