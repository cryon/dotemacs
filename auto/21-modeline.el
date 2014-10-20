(setq-default
 mode-line-format
 '(
   ;; point position
   (8 "%e "
      (:eval (propertize "%l:" 'face 'font-lock-string-face))
      (:eval (propertize "%c"  'face (if (>= (current-column) 80)
                                         'font-lock-warning-face
                                       'font-lock-string-face))))

   ;; major modes
   ;; not interested in minor modes
   ;; (can always be listed with C-h m)
   (:propertize "%m: " face font-lock-variable-name-face
                help-echo buffer-file-coding-system)

   ;; shortened directory
   (:propertize (:eval (shorten-directory default-directory 35))
                face font-lock-comment-face)

   ;; buffer name
   (:propertize "%b" face font-lock-doc-face)

   ;; jabber activity - right aligned
   (:eval
    (propertize
     " "
     'display
     `(space
       :align-to (- right 22 ,(string-width jabber-activity-mode-string)))))
   (:eval jabber-activity-mode-string)

   ;; right align
   (:eval (propertize " " 'display '(space :align-to (- right 20))))

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

;; helper function
;; stolen from: http://amitp.blogspot.se/2011/08/emacs-custom-mode-line.html
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))
