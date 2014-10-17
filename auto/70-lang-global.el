(add-hook 'before-save-hook
	  (lambda ()
	    (delete-trailing-whitespace)))

(load-package 'autopair)
(autopair-global-mode)
