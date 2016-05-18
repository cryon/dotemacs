(add-hook 'before-save-hook
	  (lambda ()
	    (delete-trailing-whitespace)))

(load-package 'autopair)
(autopair-global-mode)

(hl-line-mode)
(setq show-trailing-whitespace 1)
(add-hook 'prog-mode-hook 'linum-mode)
