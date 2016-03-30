(load-package 'rust-mode)
(load-package 'racer)

(setq racer-rust-src-path (getenv "RUST_SRC_PATH"))

(add-hook 'racer-mode-hook #'company-mode)

(global-set-key [C-tab] 'company-complete)
(setq company-tooltip-align-annotations t)
