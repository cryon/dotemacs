;; ---------------------------------------------------------------------------
;; -- Simplified emacs configuration
;; ---------------------------------------------------------------------------

(defvar config-dir (file-name-directory load-file-name))
(defvar hostname (downcase (car (split-string system-name "\\."))))

(defun beginning-of-line-or-indentation ()
  "Move point to beginning of line or indentation if already there"
  (interactive)
  (let ((pos (point)))
    (back-to-indentation)
    (when (= pos (point)) (beginning-of-line))))

(defun --config/load-all (path)
  "Loads all Emacs Lisp files in PATH relative to config-dir"
  (let ((dir (concat config-dir path)))
    (mapc (lambda (f) (load-file (concat (file-name-as-directory dir) f)))
	  (directory-files dir nil "\\.el$"))))

(defun --config/run-after-startup ()
  "Function to be used with emacs-startup-hook"
  (--config/load-all "auto")
  (when (file-exists-p custom-file) (load custom-file))
  (cd "~")
  (message "Hack the planet!"))

;; -- General configuration --------------------------------------------------

(use-package emacs
  :init
  (setq frame-title-format "Emacs: %b"
	frame-resize-pixelwise t
	line-number-mode t
	column-number-mode t
	inhibit-startup-message t
	initial-scratch-message ""
	initial-major-mode 'text-mode
	ring-bell-function 'ignore
	scroll-conservatively 10000
	scroll-step 1
	indent-tabs-mode nil
	fill-column 78
	show-paren-delay 0
	custom-file (concat config-dir ".customizations.el")
	enable-recursive-minibuffers t
	gamegrid-glyph-height-mm 4.0
	dired-dwim-target t
	use-short-answers t

	mac-option-key-is-meta nil
	mac-command-key-is-meta t
	mac-command-modifier 'meta
	mac-option-modifier 'none

	;; backups, lockfiles and autosaves
	create-lockfiles nil
	auto-save-file-name-transforms `((".*" ,(concat config-dir "autosaves/") t))
	backup-directory-alist `(("." . ,(concat config-dir "backups")))
	backup-by-copying t
	version-control t
	delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2)

  :config
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (set-frame-font (if (eq system-type 'darwin) "Hasklig-18" "Hasklig-13") nil t)
  (show-paren-mode t)
  (winner-mode 1)
  (delete-selection-mode 1)
  (minibuffer-depth-indicate-mode)

   :bind
   (("C-S-a" . windmove-left)
    ("C-S-d" . windmove-right)
    ("C-S-w" . windmove-up)
    ("C-S-s" . windmove-down)
    ("C-x a" . align-regexp)
    ("C-a"   . beginning-of-line-or-indentation)

    :map minibuffer-local-completion-map
    ("SPC" . nil))

  :hook
  ((emacs-startup . --config/run-after-startup)
   (before-save . delete-trailing-whitespace)))

(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")))

(use-package savehist :hook (after-init . savehist-mode))

(use-package visual-line-mode
  :hook ((org-mode text-mode markdown-mode) . visual-line-mode))

(use-package eshell
  :init (setq
	 eshell-save-history-on-exit t
	 eshell-hist-ignoredups t
	 eshell-cmpl-cycle-completions nil
	 eshell-scroll-to-bottom-on-input 'all))

(use-package esh-mode
  :config
  (defun eshell/clear ()
    (interactive)
    (eshell/clear-scrollback))

  (defun eshell/emacs (file)
    (find-file file)))

(use-package project
  :init
  (setq project-switch-commands
	'((project-find-file "Find file" "f")
          (project-dired "Dired" "d")
          (project-eshell "Eshell" "e")
          (consult-ripgrep "ripgrep" "g")
          (magit-project-status "Magit" "m"))))

;; -- Vertico, Consult, Marginalia, Orderless --------------------------------

(use-package vertico :ensure t :defer t
  :init (vertico-mode)
  :config (setq vertico-preselect 'first)
  :custom (vertico-cycle t))

(use-package consult :ensure t
  :hook vertico-mode
  :bind ("C-M-f" . consult-ripgrep)
  :init (setq completion-in-region-function #'consult-completion-in-region))

(use-package orderless :ensure t
  :hook vertico-mode
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion))))
  (orderless-matching-styles '(orderless-literal orderless-flex)))

(use-package marginalia :ensure t
  :hook vertico-mode
  :config
  (setq marginalia-align 'right)
  (marginalia-mode))

(use-package vertico-directory
  :after vertico
  :bind
  (:map vertico-map
	("M-DEL" . vertico-directory-delete-word)
	("DEL" . vertico-directory-delete-char)
	("RET" . vertico-directory-enter))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; -- Org and Org Roam -------------------------------------------------------

(use-package org :defer t
  :init
  (setq org-return-follows-link t
	org-hide-emphasis-markers t)
  :custom-face
  (org-document-title ((t (:weight bold :height 1.5 :underline nil))))
  (org-level-1        ((t (:weight bold :height 1.3))))
  (org-level-2        ((t (:weight bold :height 1.2))))
  (org-level-3        ((t (:weight bold :height 1.1))))
  (org-level-4        ((t (:weight bold :height 1.0)))))

(use-package org-indent :hook org-mode)
(use-package org-superstar :ensure t :hook org-mode)

(use-package org-roam :ensure t :defer t
  :custom
  (org-roam-directory "~/RoamNotes")
  (org-roam-complete-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n"))))

  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)

   :map org-mode-map
   ("C-M-i" . completion-at-point))

  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)

  :config
  (require 'org-roam-dailies)
  (org-roam-db-autosync-mode))

;; -- Third-party packages ---------------------------------------------------

(use-package almost-mono-themes :ensure t :defer t)
(use-package gruvbox-theme      :ensure t :defer t)
(use-package doom-themes        :ensure t :defer t)
(use-package nord-theme         :ensure t :defer t)

(use-package visual-fill-column :ensure t :defer t)
(use-package gdscript-mode      :ensure t :defer t)
(use-package markdown-mode      :ensure t :defer t)
(use-package windresize         :ensure t :defer t)
(use-package restclient         :ensure t :defer t)
(use-package git-gutter         :ensure t :defer t)
(use-package yaml-mode          :ensure t :defer t)

(use-package magit :ensure t :defer t
  :bind ("C-x g" . magit-status)
  :custom
  (magit-diff-refine-hunk t)
  (magit-popup-use-prefix-argument 'default)
  (magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
  (magit-bury-buffer-function 'magit-restore-window-configuration))

(use-package mood-line :ensure t
  :config (mood-line-mode))

(use-package move-text :ensure t
  :bind (("M-<up>" . move-text-up)
	 ("M-<down>" . move-text-down)))

(use-package git-gutter-fringe :ensure t :defer t
  :init (setq git-gutter:hide-gutter t)
  :config (global-git-gutter-mode +1))

(use-package gptel :ensure t :defer t
  :config (setq gptel-default-mode #'org-mode))

(use-package multiple-cursors :ensure t :defer t
  :bind ("C-ä" . mc/mark-next-like-this))

(use-package expand-region :ensure t :defer t
  :bind (("C-." . er/expand-region)
	 ("C-," . er/contract-region)))

(use-package ligature :ensure t :defer t
  :config
  (ligature-set-ligatures
   'prog-mode ;; Tuned for hasklig
   '("&&" "***" "*>" "\\\\" "||" "|>" "::"
     "==" "===" "==>" "=>" "=<<" "!!" ">>"
     ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
     "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
     "<<" "<<<" "<+>" ".." "..." "++" "+++"
     "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->"))
  (global-ligature-mode t))
