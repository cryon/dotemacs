;; Todo: This is very sloppy copy and paste
;; mostly from https://github.com/james-stoup/emacs-org-mode-tutorial
;; needs some cleanup

(use-package org-superstar
  :ensure t
  :hook ((org-mode . org-superstar-mode)))

(setq org-return-follows-link   t
      org-hide-emphasis-markers t)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-indent-mode)

(let* ((base-font-color     (face-foreground 'default nil 'default))
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

  (add-hook 'org-mode-hook 'visual-line-mode)
  (custom-theme-set-faces
   'user
   `(org-level-4 ((t (,@headline :height 1.1))))
   `(org-level-3 ((t (,@headline :height 1.2))))
   `(org-level-2 ((t (,@headline :height 1.3))))
   `(org-level-1 ((t (,@headline :height 1.5))))
   `(org-document-title ((t (,@headline :height 1.6 :underline nil))))))
