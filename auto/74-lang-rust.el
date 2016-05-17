(load-package 'rust-mode)
(load-package 'racer)
(load-package 'cargo)
(load-package 'flycheck-rust)

(setq racer-rust-src-path (getenv "RUST_SRC_PATH")
      company-tooltip-align-annotations t)

(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

;; todo: move to key-bindings.el if I like it
(global-set-key [C-tab] 'company-complete)
