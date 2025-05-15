(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (set-frame-size (selected-frame) 100 45))

(setq
 ;; frame title
 frame-title-format "Emacs: %b"

 ;; pixel-wise frame size works better with some WMs
 frame-resize-pixelwise t

 ;; point position
 line-number-mode t
 column-number-mode t

 ;; no startup messages
 inhibit-default-init t
 inhibit-startup-message t
 initial-scratch-message ""

 ;; i usually write text in the scratch buffer
 initial-major-mode 'text-mode

 ;; be a little less anoying
 visible-bell nil
 ring-bell-function 'ignore

 ;; backup files
 backup-directory-alist `(("." . ,(concat config-dir "backups")))
 backup-by-copying t
 version-control t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2

 ;; don't want lockfiles
 create-lockfiles nil

 ;; place autosaves separatly
 auto-save-file-name-transforms `((".*" ,(concat config-dir "autosaves/") t))

 ;; scroll nicely
 scroll-conservatively 10000
 scroll-step 1

 ;; editing
 indent-tabs-mode nil
 fill-column 80
 show-paren-delay 0

 ;; Need to see the tetrominos more clearly
 gamegrid-glyph-height-mm 7.0

 ;; dired
 dired-dwim-target t

 ;; customizations in own file
 custom-file (--config-path "customizations.el")

 ;; I heard you like minibuffers
 enable-recursive-minibuffers t
 )

(show-paren-mode t)
(winner-mode 1)
(delete-selection-mode 1)
(fset 'display-startup-echo-area-message 'ignore)
(minibuffer-depth-indicate-mode)

;; remove any trailing whitespace
(add-hook 'before-save-hook
	  (lambda ()
	    (delete-trailing-whitespace)))

;; y or n instead of yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; from https://christiantietze.de/posts/2021/06/emacs-center-window-single-function/
(defun my/frame-recenter (&optional frame)
  "Center FRAME on the screen.
FRAME can be a frame name, a terminal name, or a frame.
If FRAME is omitted or nil, use currently selected frame."
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (let* ((frame (or (and (boundp 'frame) frame) (selected-frame)))
            (frame-w (frame-pixel-width frame))
            (frame-h (frame-pixel-height frame))
            ;; frame-monitor-workarea returns (x y width height) for the monitor
            (monitor-w (nth 2 (frame-monitor-workarea frame)))
            (monitor-h (nth 3 (frame-monitor-workarea frame)))
            (center (list (/ (- monitor-w frame-w) 2)
                          (/ (- monitor-h frame-h) 2))))
      (apply 'set-frame-position (flatten-list (list frame center))))))

(add-hook 'after-init-hook #'my/frame-recenter)
(add-hook 'after-make-frame-functions #'my/frame-recenter)

;; Not sure where to put this...
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :foreground "white" :height 1.8 :underline (:color "#777777")))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :foreground "white" :height 1.4))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :foreground "white" :height 1.2))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face :foreground "white" :height 1.0)))))
