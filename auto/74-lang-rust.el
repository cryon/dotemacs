(load-package 'rust-mode)
(load-package 'racer)

(setq racer-rust-src-path (getenv "RUST_SRC_PATH"))

(add-hook 'racer-mode-hook #'company-mode)

(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)
