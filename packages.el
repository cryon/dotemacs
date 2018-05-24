;; -- Setup use-package --
(require 'package)

(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; -- Magit --
(use-package magit :ensure t
  :init
  (setq
   magit-status-buffer-switch-function 'switch-to-buffer
   magit-diff-refine-hunk t
   magit-popup-use-prefix-argument 'default
   magit-last-seen-setup-instructions "1.4.0")
  :bind
  (("C-x g" . magit-status)))
  
;; -- Move text --
(use-package move-text :ensure t
  :bind
  (("M-<up>" . move-text-up)
   ("M-<down>" . move-text-down)))

;; -- Windresize --
(use-package windresize :ensure t)

;; -- Mutiple cursors --
(use-package multiple-cursors :ensure t
  :bind
  (("C-ä" . mc/mark-text-like-this)))

;; -- Unkillable scratch --
(use-package unkillable-scratch :ensure t
  :config
  (unkillable-scratch))

;; -- Git gutter --
(if window-system
    (use-package git-gutter-fringe :ensure t
      :init
      (setq git-gutter:hide-gutter t)
      :config
      (global-git-gutter-mode +1))
  (use-package git-gutter))

;; -- Twittering mode --
(use-package twittering-mode :ensure t)

;; -- Projectile --
(use-package projectile :ensure t
  :config
  (projectile-global-mode))

;; -- Ido mode --
(use-package ido-vertical-mode :ensure t
  :init
  (setq ido-enable-flex-matching t
	ido-everywhere t)
  :config
  (ido-mode t)
  (ido-vertical-mode 1))

(use-package smex :ensure t
  :bind
  (("M-x" . smex)))

(use-package ido-complete-space-or-hyphen :ensure t)

;; -- Neotree --
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
