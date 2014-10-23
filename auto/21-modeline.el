(setq-default
 mode-line-format
 '(
   ;; point position
   (8
    (:propertize " %l:" face font-lock-string-face)
    (:eval (propertize "%c" 'face (if (>= (current-column) 80)
                                      'font-lock-warning-face
                                    'font-lock-string-face))))

   ;; major modes
   ;; not interested in minor modes
   ;; (can always be listed with C-h m)
   (:propertize "%m: " face font-lock-variable-name-face
                help-echo buffer-file-coding-system)

   ;; shortened directory (if not special buffer)
   (:eval
    (unless (special-buffer-p (buffer-name))
      (propertize (shorten-directory default-directory 35)
                  'face 'font-lock-comment-face)))

   ;; buffer name
   (:propertize "%b" face font-lock-doc-face)

   ;; right aligned stuff
   (:eval
    (let* ((status-offset 2)
           (nyan-offset
            (+ status-offset (if nyan-mode (+ 2 nyan-bar-length) 0)))
           (jabber-offset
            (+ nyan-offset (string-width jabber-activity-mode-string))))
      (concat
       ;; jabber activity
       (propertize " " 'display `(space :align-to (- right ,jabber-offset)))
       jabber-activity-mode-string

       ;; nyan-cat
       (when nyan-mode
         (concat
          (propertize " " 'display `(space :align-to (- right ,nyan-offset)))
          (propertize "|" 'face 'vertical-border)
          (nyan-create)
          (propertize "|" 'face 'vertical-border)))

       ;; read-only / changed
       (propertize " " 'display `(space :align-to (- right ,status-offset)))
       (cond (buffer-read-only
              (propertize "RO" 'face 'font-lock-warning-face))
             ((buffer-modified-p)
              (propertize "* " 'face 'font-lock-warning-face))
             (t "  ")))))))

(defun special-buffer-p (buffer-name)
  "Check if buffer-name is the name of a special buffer. I.e.
  starts and ends with *"
  (string-match-p "^\\*.+\\*$" buffer-name))

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
