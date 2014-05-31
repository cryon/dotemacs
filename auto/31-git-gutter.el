
(if window-system
    (progn
      (load-package 'git-gutter-fringe)
            
      (setq git-gutter:added-sign " ")
      (setq git-gutter:deleted-sign " ")
      (setq git-gutter:modified-sign " ")
      (setq git-gutter:hide-gutter t))
  (progn
    (load-package 'git-gutter)))

(global-git-gutter-mode +1)
