(if window-system
    (progn
      (load-package 'rainbow-mode)

      ;; (load-package 'powerline)
      ;; (powerline-default-theme)

      (load-package 'subatomic-theme)
      ;;(setq subatomic-high-contrast t)
      (load-theme 'subatomic t))
  (progn
    (load-package 'subatomic256-theme)
    (load-theme 'subatomic256 t)))
