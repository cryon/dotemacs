;; Simplified Emacs configuration

(defvar config-dir (file-name-directory load-file-name))
(defvar hostname (downcase (car (split-string system-name "\\."))))

(defun --config-path (file)
  "Path to file in config directory"
  (concat config-dir file))

(defun --load-config-file (file)
  "Load file relative to the configuration folder"
  (let ((path (--config-path file)))
    (when (file-exists-p path)
      (load-file path))))

(defun --load-config-directory (relative-dir)
  "Load all .el files in a directory relative to the configuration folder"
  (let ((dir (concat config-dir relative-dir)))
    (mapc (lambda (f) (load-file (concat (file-name-as-directory dir) f)))
	  (directory-files dir nil "\\.el$"))))

(--load-config-file "general.el")
(--load-config-file "packages.el")
(--load-config-file "keybindings.el")
(--load-config-directory "auto")

(when (eq system-type 'darwin)
  (--load-config-file "mac-configurations.el"))

(when (eq system-type 'windows-nt)
  (--load-config-file "win-configurations.el"))

(cd "~")
(eshell)
