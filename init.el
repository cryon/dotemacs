;;                        Cryon's Emacs configuration
;;                        ---------------------------

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
(eshell)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (esh-mode ido-complete-space-or-hyphen smex ido-ubiquitous ido-vertical-mode projectile uniquify nyan-mode git-gutter-fringe unkillable-scratch windresize move-text winner-mode magit use-package neotree doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
