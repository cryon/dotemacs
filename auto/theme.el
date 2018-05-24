(use-package doom-themes
  :ensure t
  
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-spacegrey t)
  
  :config
  (doom-themes-neotree-config)
  (doom-themes-org-config)
  
  (let ((full-green "#00ff00")
	(full-red   "#ff0000"))
    
    (set-face-attribute
     'trailing-whitespace nil :foreground full-red :underline t)

    (set-face-attribute
     'show-paren-match nil :foreground full-green :bold t)

    (set-face-attribute
     'show-paren-mismatch nil :foreground full-red :bold t)

    (set-face-attribute
     'trailing-whitespace nil :foreground full-red :underline t)))
