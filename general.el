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
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

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

;; we want to be able to restore old window configurations
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; send all backups and auto-saves to the systems temp-folder
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; make parenthesis stick out
(show-paren-mode t)
(setq show-paren-delay 0)

;; no tabs
(setq-default indent-tabs-mode nil)

;; erc
(setq erc-timestamp-only-if-changed-flag nil
      erc-timestamp-format "%H:%M:%S "
      erc-fill-prefix "         "
      erc-insert-timestamp-function 'erc-insert-timestamp-left
      erc-nick "cryon"
      erc-user-fullname "john"
      erc-prompt ">")
