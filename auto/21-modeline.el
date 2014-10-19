(setq-default
 mode-line-format
 '(
   ;; point position
   (8 "%e "
      (:eval (propertize "%l:" 'face 'font-lock-comment-face))
      (:eval (propertize "%c"  'face (if (>= (current-column) 80)
                                         'font-lock-warning-face
                                       'font-lock-comment-face))))

   ;; major modes
   ;; not interested in minor modes
   ;; (can always be listed with C-h m)
   (:propertize "%m: " face font-lock-variable-name-face
                help-echo buffer-file-coding-system)

   ;; shortened directory
   (:propertize (:eval (shorten-directory default-directory 30))
                face font-lock-comment-face)

   ;; buffer name
   (:propertize "%b" face font-lock-doc-face)

   ;; left align
   (:eval (propertize " " 'display '((space :align-to (- right-fringe 36)))))

   ;; nyan cat saves the day
   (:propertize "|" face vertical-border)
   (:eval (when nyan-mode (nyan-create)))
   (:propertize "|" face vertical-border)

   ;; read-only / changed
   (:eval
    (cond (buffer-read-only
           (propertize "RO" 'face 'font-lock-warning-face))
          ((buffer-modified-p)
           (propertize "* " 'face 'font-lock-warning-face))
          (t "  ")))))

;; rename a few major modes
(add-hook 'emacs-lisp-mode-hook
          (lambda() (setq mode-name "Elisp")))

(add-hook 'haskell-mode-hook
          (lambda() (setq mode-name "Haskell")))
