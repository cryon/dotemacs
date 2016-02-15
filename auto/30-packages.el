(load-package 'move-text)
(load-package 'expand-region)
(load-package 'yaml-mode)
(load-package 'twittering-mode)
(load-package 'windresize)
(load-package 'multiple-cursors)
(load-package 'jabber)

(load-package 'unkillable-scratch)
(unkillable-scratch)

(load-package 'projectile)
(projectile-global-mode)

;; uniquify
(load-package 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; nyan cat!
(load-package 'nyan-mode)
(setq nyan-bar-length 16)
(nyan-mode)
