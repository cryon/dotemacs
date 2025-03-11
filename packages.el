(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package almost-mono-themes
  :ensure t
  :if window-system
  :config
  (load-theme 'almost-mono-white t))

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures
   'prog-mode
   '("&&" "***" "*>" "\\\\" "||" "|>" "::"
     "==" "===" "==>" "=>" "=<<" "!!" ">>"
     ">>=" ">>>" ">>-" ">-" "->" "-<" "-<<"
     "<*" "<*>" "<|" "<|>" "<$>" "<>" "<-"
     "<<" "<<<" "<+>" ".." "..." "++" "+++"
     "/=" ":::" ">=>" "->>" "<=>" "<=<" "<->"))
  (global-ligature-mode t))

(use-package magit :ensure t
  :init
  (setq
   magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1
   magit-diff-refine-hunk t
   magit-popup-use-prefix-argument 'default
   magit-log-margin '(t age-abbreviated magit-log-margin-width :author 15))
  (when (not window-system)
    (setq magit-section-visibility-indicator '("..." . t)))
  :bind
  (("C-x g" . magit-status)))

(use-package company :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq
   company-minimum-prefix-length 1
   company-idle-delay  (lambda ()
			 (if (company-in-string-or-comment) nil 0.0)))
  :bind (("C-n" . company-select-next)
	 ("C-p" . company-select-previous)))

(use-package move-text :ensure t
  :bind (("M-<up>" . move-text-up)
	 ("M-<down>" . move-text-down)))

(use-package doom-modeline :ensure t
  :custom
  (doom-modeline-icon nil)
  (doom-modeline-height 0)
  (doom-modeline-bar-width 10)

  :init
  (doom-modeline-mode 1))

(use-package eshell
  :init
  (setq
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

(use-package windresize :ensure t)

(use-package multiple-cursors :ensure t
  :bind
  (("C-ä" . mc/mark-next-like-this)))

(use-package expand-region :ensure t
  :bind
  (("C-." . er/expand-region)
   ("C-," . er/contract-region)))

(use-package unkillable-scratch :ensure t
  :config
  (unkillable-scratch))

(use-package git-gutter-fringe :ensure t
  :if window-system
  :init
  (setq git-gutter:hide-gutter t)
  :config
  (global-git-gutter-mode +1))

(use-package git-gutter
  :ensure t
  :if window-system)

(use-package restclient :ensure t)

(use-package projectile :ensure t
  :init
  (setq projectile-switch-project-action
	(lambda () (magit-status (projectile-project-root))))
  :bind
  ("M-ä" . projectile-run-eshell)

  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-global-mode))

(use-package ido-vertical-mode :ensure t
  :init
  (setq ido-enable-flex-matching t
	ido-everywhere t
	ido-vertical-define-keys 'C-n-C-p-up-and-down
	ido-auto-merge-work-directories-length -1)
  :config
  (ido-mode t)
  (ido-vertical-mode 1))

(use-package ido-complete-space-or-hyphen :ensure t)

(use-package smex :ensure t
  :bind
  (("M-x" . smex)))

(use-package ediff
  :config
  (progn
    (setq ediff-split-window-function 'split-window-horizontally)))

(use-package gdscript-mode :ensure t)

(use-package duplicate-thing :ensure t
  :bind
  (("M-c" . duplicate-thing)))

(use-package all-the-icons :ensure t)

(use-package neotree :ensure t
  :init
  (setq neo-window-fixed-size nil
	neo-theme (if (display-graphic-p) 'icons 'arrow)
	neo-show-updir-line nil
	neo-modern-sidebar t
	neo-auto-indent-point t
	neo-cwd-line-style 'button)

  :config
  (add-to-list
   'window-size-change-functions
   (lambda (frame)
     (let ((neo-window (neo-global--get-window)))
       (unless (null neo-window)
         (setq neo-window-width (window-width neo-window))))))

  (defun neotree-project-dir-toggle ()
    "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
    (interactive)
    (let ((project-dir
           (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
             (projectile-project-root)
             ;;(ffip-project-root)
             ))
          (file-name (buffer-file-name))
          (neo-smart-open t))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
	(progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-find file-name))))))

  :bind
  (("M-ö" . neotree-project-dir-toggle)))

(use-package yaml-mode
  :ensure t
  :hook ((yaml-mode . whitespace-mode)))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :custom-face
  (markdown-header-face-1 ((t (:inherit markdown-header-face :foreground "black" :height 1.8 :underline (:color "#777777")))))
  (markdown-header-face-2 ((t (:inherit markdown-header-face :foreground "black" :height 1.4))))
  (markdown-header-face-3 ((t (:inherit markdown-header-face :foreground "black" :height 1.2))))
  (markdown-header-face-4 ((t (:inherit markdown-header-face :foreground "black" :height 1.0))))
  :bind
  (("C-c C-e" . markdown-do)))
