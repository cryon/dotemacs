;; frame title: Emacs @ <hostname>: <buffer>
(setq frame-title-format
      (format "Emacs @ %s: %s"
	      (downcase (car (split-string system-name "\\.")))
	      "%b"))

;; always syntax highlight
(global-font-lock-mode t)

;; navigation
(setq line-number-mode t)
(setq column-number-mode t)

;; cleaner interface
(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

(when (not window-system)
  (menu-bar-mode -1))

;; no startup messages
(setq inhibit-default-init t)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message (user-login-name))

;; a little less annoyance
(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(delete-selection-mode 1)
(setq next-line-add-newlines nil)

;; scrolling
(setq scroll-conservatively 10000)
(setq scroll-step 1)

;; empty scratch
(setq initial-scratch-message "")

;; mondays starts the week in my locale
(setq calendar-week-start-day 1)

;; send all backups and auto-saves to the systems temp-folder
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; make parenthesis stick out
(show-paren-mode t)
(setq show-paren-delay 0)

;; no tabs
(setq-default indent-tabs-mode nil)

;; 80 columns seems nice...
(setq-default fill-column 80)

;; start emacs daemon
(server-start)

;; default working directory will be the home directory
(cd "~")

;; start an eshell
(eshell)
(rename-buffer "eshell")

