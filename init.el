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
	  "hooks.el"
          "jabber.el"))

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
    (load-package 'move-text)
    (load-package 'expand-region)
    (load-package 'erc-hl-nicks)
    (load-package 'haskell-mode)
    (load-package 'yaml-mode)
    (load-package 'twittering-mode)
    (load-package 'windresize)
    (load-package 'multiple-cursors)
    (load-package 'jabber)

    ;; git-gutter
    (load-package 'git-gutter-fringe)
    (global-git-gutter-mode +1)

    ;; magit
    (setq magit-status-buffer-switch-function 'switch-to-buffer)
    (load-package 'magit)

    ;; uniquify
    (load-package 'uniquify)
    (setq uniquify-buffer-name-style 'post-forward)

    ;; ido mode
    (load-package 'ido-vertical-mode)
    (load-package 'ido-ubiquitous)
    (load-package 'smex)
    (load-package 'ido-complete-space-or-hyphen)
    (ido-vertical-mode 1)

    ;; yasnippet
    (load-package 'yasnippet)
    (load-package 'yasnippet-bundle)
    ;;(yas-global-mode 1)

    ;; visuals
    (when window-system
      (load-package 'rainbow-mode)

      (load-package 'powerline)
      (powerline-default-theme)

      (load-package 'subatomic-theme)
      (load-theme 'subatomic t))

    ;; finally
    (cd "~")
    (eshell)
    (rename-buffer "eshell")
    (message "fun will now commence...")))
