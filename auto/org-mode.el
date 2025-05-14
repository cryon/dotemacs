(setq org-return-follows-link   t
      org-hide-emphasis-markers t)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'org-indent-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(use-package org-superstar
  :ensure t
  :hook ((org-mode . org-superstar-mode)))

(custom-theme-set-faces
 'user
 '(org-level-4 ((t (:weight bold :height 1.0))))
 '(org-level-3 ((t (:weight bold :height 1.1))))
 '(org-level-2 ((t (:weight bold :height 1.2))))
 '(org-level-1 ((t (:weight bold :height 1.3))))
 '(org-document-title ((t (:weight bold :height 1.5 :underline nil)))))


(let ((roam-notes-directory "~/RoamNotes"))
  (when (file-directory-p roam-notes-directory)
    (use-package org-roam
      :ensure t
      :custom
      (org-roam-directory roam-notes-directory)
      (org-roam-complete-everywhere t)
      (org-roam-capture-templates
       '(("d" "default" plain
	  "%?"
	  :if-new
	  (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
	  :unnarrowed t)))
      :bind
      (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       :map org-mode-map
       ("C-M-i" . completion-at-point)
       :map org-roam-dailies-map
       ("Y" . org-roam-dailies-capture-yesterday)
       ("T" . org-roam-dailies-capture-tomorrow))
      :bind-keymap
      ("C-c n d" . org-roam-dailies-map)
      :config
      (require 'org-roam-dailies)
      (org-roam-db-autosync-mode))))
