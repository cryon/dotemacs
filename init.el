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
      '(("gnu"        . "http://elpa.gnu.org/packages/")
	("elpa"       . "http://tromey.com/elpa/")
	("marmalade"  . "http://marmalade-repo.org/packages/")
	("melpa"      . "http://melpa.milkbox.net/packages/")))

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
      (powerline-default-theme))

    (load-package 'move-text)
    (load-package 'expand-region)
    (load-package 'erc-hl-nicks)
    (load-package 'haskell-mode)
    (load-package 'yaml-mode)
    (load-package 'twittering-mode)
    (load-package 'windresize)
    (load-package 'multiple-cursors)

    (load-package 'magit)
    ;; magit in whole frame
    (setq magit-status-buffer-switch-function 'switch-to-buffer)

    (load-package 'uniquify)
    (setq uniquify-buffer-name-style 'post-forward)

    ;; finally
    (cd "~")
    (eshell)
    (rename-buffer "eshell")
    (message "fun will now commence...")))
