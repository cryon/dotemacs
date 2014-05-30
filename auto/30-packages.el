(load-package 'move-text)
(load-package 'expand-region)
(load-package 'haskell-mode)
(load-package 'yaml-mode)
(load-package 'twittering-mode)
(load-package 'windresize)
(load-package 'multiple-cursors)
(load-package 'jabber)

;; git-gutter
(load-package 'git-gutter-fringe)
(global-git-gutter-mode +1)

;; magit
(load-package 'magit)
(setq magit-status-buffer-switch-function 'switch-to-buffer)

;; uniquify
(load-package 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
