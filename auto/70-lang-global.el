(add-hook 'before-save-hook
	  (lambda ()
	    (delete-trailing-whitespace)))
