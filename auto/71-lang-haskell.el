(load-package 'haskell-mode)

(add-hook 'haskell-mode-hook
          'haskell-indentation-mode)

;; haskell-mode keybindings
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)

;; tell me about redundant imports
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t))

(setq
 haskell-compile-cabal-build-command "cd %s && stack build"
 haskell-process-type 'stack-ghci
 haskell-interactive-popup-errors nil
 haskell-process-path-ghci "stack"
 haskell-process-args-ghci "ghci")

(load-package 'haskell-interactive-mode)
(load-package 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(load-package 'flycheck)
(load-package 'flycheck-haskell)
(add-hook 'haskell-mode-hook 'flycheck-mode)
(add-hook 'flycheck-mode-hook 'flycheck-haskell-configure)

(load-package 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-interactive-mode-hook 'company-mode)
