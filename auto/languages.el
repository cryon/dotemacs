
;; global
(use-package flycheck
  :ensure t
  :hook
  (prog-mode . flycheck-mode))

(use-package company
  :ensure t
  :hook
  (prog-mode . company-mode)

  :config
  (setq company-tooltip-align-annotations t
	company-minimum-prefix-length 1))

(use-package lsp-mode
  :ensure t
  :commands lsp

  :config
  (require 'lsp-clients))

(use-package lsp-ui
  :ensure t)

;; rust

(use-package toml-mode
  :ensure t)

(use-package rust-mode
  :ensure t
  :hook (rust-mode . lsp))

;; Add keybindings for interacting with Cargo
(use-package cargo
  :ensure t
  :hook
  (rust-mode . cargo-minor-mode))

(use-package flycheck-rust
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
