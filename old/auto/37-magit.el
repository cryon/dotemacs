(setq magit-last-seen-setup-instructions "1.4.0")

(load-package 'magit)

(setq
 magit-status-buffer-switch-function 'switch-to-buffer
 magit-diff-refine-hunk t
 magit-popup-use-prefix-argument 'default)
