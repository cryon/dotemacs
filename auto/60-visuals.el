(load-package 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-night t)

;; color theme overrides
(let ((bg "#1d1f21")
      (fg "#c5c8c6")
      (selection "#373b41")
      (comment "#969896")
      (red "#cc6666")
      (full-red "#ff0000")
      (yellow "#f0c674")
      (green "#b5bd68")
      (full-green "#00ff00"))

  ;; fringe
  (set-face-attribute 'fringe nil :background bg)
  (set-face-attribute 'git-gutter-fr:modified nil :background bg :foreground yellow)
  (set-face-attribute 'git-gutter-fr:added nil :background bg :foreground green)
  (set-face-attribute 'git-gutter-fr:deleted nil :background bg :foreground red)

  ;; whitespace
  (set-face-attribute 'trailing-whitespace nil :background bg :foreground red :underline t)

  ;; paren
  (set-face-attribute 'show-paren-match nil :background bg :foreground full-green :bold t)
  (set-face-attribute 'show-paren-mismatch nil :background bg :foreground full-red :bold t)

  ;; mode line
  (set-face-attribute 'mode-line nil :box `(:line-width 1 :color ,selection))
  (set-face-attribute 'modeline-inactive nil :box `(:line-width 1 :color ,selection) :background bg)

  ;; linum mode
  (set-face-attribute 'linum nil :background bg :foreground selection)

  ;; cursor
  (set-cursor-color fg))

;; extras
(when window-system
  (load-package 'rainbow-mode))


;; leaving this since I cannot make up my mind
;; (if window-system
;;     (progn
;;       (load-package 'subatomic-theme)
;;       (setq subatomic-high-contrast
;;       (load-theme 'subatomic t))
;;   (progn
;;     (load-package 'subatomic256-theme)
;;     (load-theme 'subatomic256 t))))
