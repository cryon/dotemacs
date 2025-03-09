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

(--load-config-file "general.el")
(--load-config-file "packages.el")
(--load-config-file "keybindings.el")

(when (eq system-type 'darwin)
  (--load-config-file "mac-configurations.el"))
