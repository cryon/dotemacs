(defconst config-dir (file-name-directory load-file-name)
  "Path of the directory containing this file")

(defvar hostname (downcase (car (split-string system-name "\\.")))
  "Hostname in lowercase")

(defvar os (symbol-name system-type)
  "Identifier for the operating system in use")

(let ((gc-cons-threshold most-positive-fixnum))
  (add-hook 'focus-out-hook 'garbage-collect)

  (defun load-custom (file)
    (let ((path (concat config-dir file)))
      (when (file-exists-p path)
	(load-file path))))

  (defun load-directory (dir)
    (mapc (lambda (f) (load-file (concat (file-name-as-directory dir) f)))
	  (directory-files dir nil "\\.el$")))

  (load-custom "general.el")
  (load-custom (concat "platform/os-" os ".el"))
  (load-custom (concat "platform/host-" hostname ".el"))
  (load-custom "packages.el")
  (load-custom "keys.el")
  (load-directory (concat config-dir "auto"))

  (server-start)
  (cd "~")
  (eshell))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (all-the-icons yaml-mode xterm-color windresize use-package unkillable-scratch twittering-mode toml-mode smex restclient racer projectile org-bullets nyan-mode neotree multiple-cursors move-text magit lsp-ui ido-vertical-mode ido-complete-space-or-hyphen haskell-mode hacker-typer git-gutter-fringe geiser gdscript-mode flymake-rust flycheck-rust fireplace expand-region duplicate-thing dockerfile-mode docker company color-theme-sanityinc-tomorrow cargo autopair))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.2 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.2))))
 '(org-level-2 ((t (:inherit default :weight bold :font "Lucida Grande" :height 1.1))))
 '(org-level-3 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-4 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-5 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-6 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-7 ((t (:inherit default :weight bold :font "Lucida Grande"))))
 '(org-level-8 ((t (:inherit default :weight bold :font "Lucida Grande")))))
