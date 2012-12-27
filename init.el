;; -------
;; Utils
;; -------

(defvar config-dir (file-name-directory load-file-name))

(defun load-config-file (file)
  "loads a file in the config directory"
  (load (concat config-dir file)))

(defun load-package (package &optional config)
  "installs package if not present"
  (if (not (require package nil t))
      (package-install package)))

;; -------------
;; Configuration
;; -------------

(mapcar 'load-config-file
	'("os.el"
	  "hosts.el"
	  "general.el"
	  "keys.el"
	  "eshell.el"
	  "ibuffer.el"
	  "hooks.el"))

;; add repositories
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
	("elpa"      . "http://tromey.com/elpa/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa"     . "http://melpa.milkbox.net/packages/")))

;; load packages
;;(package-refresh-contents)
(add-hook
 'after-init-hook
 '(lambda ()
    (when window-system
      (load-package 'subatomic-theme)
      (load-theme 'subatomic t)

      (load-package 'rainbow-mode)

      (load-package 'powerline)
      (powerline-default))

    (load-package 'move-text)
    (load-package 'expand-region)
    (load-package 'erc-hl-nicks)
    (load-package 'yaml-mode)
    (load-package 'twittering-mode)
    (load-package 'windresize)

    (load-package 'highlight-symbol)
    (setq highlight-symbol-idle-delay 0.3)

    (load-package 'magit)
    ;; magit in whole frame
    (setq magit-status-buffer-switch-function 'switch-to-buffer)

    (load-package 'uniquify)
    (setq uniquify-buffer-name-style 'post-forward)

    (load-package 'scala-mode)
    (setq auto-mode-alist (cons '("\\.scala$" . scala-mode) auto-mode-alist))

    ;; finally
    (cd "~")
    (eshell)
    (rename-buffer "eshell")
    (message "fun will now commence...")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("944f3086f68cc5ea9dfbdc9e5846ad91667af9472b3d0e1e35a9633dcab984d5" "159bb8f86836ea30261ece64ac695dc490e871d57107016c09f286146f0dae64" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
