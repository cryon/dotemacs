
(if window-system
    (progn
      (load-package 'git-gutter-fringe)
      (setq git-gutter:hide-gutter t))
  (progn
    (load-package 'git-gutter)))

(global-git-gutter-mode +1)
