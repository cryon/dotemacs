(load-package 'autopair)
(load-package 'linum)

(setq show-trailing-whitespace 1)

(add-hook 'before-save-hook
	  (lambda ()
	    (delete-trailing-whitespace)))

(setq hl-line-sticky-flag nil)
(add-hook 'prog-mode-hook 'hl-line-mode)

(add-hook 'prog-mode-hook 'autopair-mode)
(add-hook 'prog-mode-hook 'linum-mode)
