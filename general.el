(menu-bar-mode -1)
(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(setq
 ;; frame title
 frame-title-format "Emacs: %b"

 ;; point position
 line-number-mode t
 column-number-mode t

 ;; no startup messages
 inhibit-default-init t
 inhibit-startup-message t
 inhibit-startup-echo-area-message (user-login-name)
 initial-scratch-message ""

 ;; be a little less anoying
 visible-bell nil
 ring-bell-function 'ignore

 ;; backup files
 backup-directory-alist `(("." . ,(concat config-dir "backups")))
 backup-by-copying t
 version-control t
 delete-old-versions t

 ;; scroll nicely
 scroll-conservatively 10000
 scroll-step 1

 ;; editing
 indent-tabs-mode nil
 fill-column 80
 show-paren-delay 0
 show-trailing-whitespace 1

 ;; dired
 dired-dwim-target t

 ;; customizations in own file
 custom-file (cryon--config-path "customizations.el"))

(show-paren-mode t)
(winner-mode 1)
(delete-selection-mode 1)

;; remove any trailing whitespace
(add-hook 'before-save-hook
	  (lambda ()
	    (delete-trailing-whitespace)))

;; y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)
