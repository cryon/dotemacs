
;; ;; Light theme
;; (load-package 'color-theme-sanityinc-tomorrow)
;; (load-theme 'sanityinc-tomorrow-day t)

;; (let ((bg "#ffffff")
;;       (fg "#4d4d4c")
;;       (selection "#efefef")
;;       (comment "#8e908c")
;;       (red "#cc6666")
;;       (full-red "#ff0000")
;;       (yellow "#f0c674")
;;       (green "#b5bd68")
;;       (full-green "#00ff00"))

;;   (set-face-attribute 'fringe nil :background bg)
;;   (set-face-attribute 'git-gutter-fr:modified nil :background bg :foreground yellow)
;;   (set-face-attribute 'git-gutter-fr:added nil :background bg :foreground green)
;;   (set-face-attribute 'git-gutter-fr:deleted nil :background bg :foreground red)

;;   ;; whitespace
;;   (set-face-attribute 'trailing-whitespace nil :background bg :foreground red :underline t)

;;   ;; paren
;;   (set-face-attribute 'show-paren-match nil :background bg :foreground full-green :bold t)
;;   (set-face-attribute 'show-paren-mismatch nil :background bg :foreground full-red :bold t)

;;   ;; fringe
;;   (set-face-attribute 'fringe nil :background bg)
;;   (set-face-attribute 'git-gutter-fr:modified nil :background bg :foreground yellow)
;;   (set-face-attribute 'git-gutter-fr:added nil :background bg :foreground green)
;;   (set-face-attribute 'git-gutter-fr:deleted nil :background bg :foreground red)

;;   ;; mode line
;;   (set-face-attribute 'mode-line nil :box `(:line-width 1 :color ,comment) :background selection)
;;   (set-face-attribute 'modeline-inactive nil :box `(:line-width 1 :color ,selection) :background bg)

;;   ;; linum mode
;;   (set-face-attribute 'linum nil :background bg :foreground comment)

;;   ;; cursor
;;   (set-cursor-color fg))

;; Dark theme
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
      (full-green "#00ff00")
      (full-white "#ffffff"))

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
  ;;(set-face-attribute 'modeline-inactive nil :box `(:line-width 1 :color ,selection) :background bg)

  ;; linum mode
  (set-face-attribute 'linum nil :background bg :foreground selection)

  ;; cursor
  (set-cursor-color fg)

  ;; neotree
  (set-face-attribute 'neo-dir-link-face nil :background bg :foreground fg :bold t)
  (set-face-attribute 'neo-file-link-face nil :background bg :foreground fg)
  (set-face-attribute 'neo-root-dir-face nil :background bg :foreground full-white :bold t))

;; monocrome


;; (load-package 'quasi-monochrome-theme)
;; (load-theme 'quasi-monochrome t)

;; (let ((bg "#000000")
;;       (fg "#c5c8c6")
;;       (selection "#373b41")
;;       (comment "#969896")
;;       (red "#cc6666")
;;       (full-red "#ff0000")
;;       (yellow "#f0c674")
;;       (green "#b5bd68")
;;       (full-green "#00ff00"))


;;   (set-face-attribute 'fringe nil :background bg)
;;   (set-face-attribute 'git-gutter-fr:modified nil :background bg :foreground yellow)
;;   (set-face-attribute 'git-gutter-fr:added nil :background bg :foreground green)
;;   (set-face-attribute 'git-gutter-fr:deleted nil :background bg :foreground red)

;;   ;; whitespace
;;   (set-face-attribute 'trailing-whitespace nil :background bg :foreground red :underline t)

;;   ;; paren
;;   (set-face-attribute 'show-paren-match nil :background bg :foreground full-green :bold t)
;;   (set-face-attribute 'show-paren-mismatch nil :background bg :foreground full-red :bold t)

;;   ;; mode line
;;   (set-face-attribute 'mode-line nil :box `(:line-width 1 :color ,selection) :background "#2a2a2a")
;;   ;;(set-face-attribute 'modeline-inactive nil :box `(:line-width 1 :color ,selection) :background bg)

;;   ;; linum mode
;;   (set-face-attribute 'linum nil :background bg :foreground selection)

;;   ;; vertical border
;;   (set-face-attribute 'vertical-border nil :background bg :foreground "#2a2a2a")

;;   ;; cursor
;;   (set-cursor-color fg))
