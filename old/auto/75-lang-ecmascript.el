(load-package 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(load-package 'nodejs-repl)

(add-hook
 'js2-mode-hook
 '(lambda ()
    (local-set-key (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
    (local-set-key (kbd "C-x C-r") 'nodejs-repl-send-region)
    (local-set-key (kbd "C-c b") 'nodejs-repl-send-buffer)))

(setq js2-basic-offset 2)
