;; Globals ---------------------------------------------------------------------

;; directory containing this init script

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defvar config-dir (file-name-directory load-file-name))

;; hostname to be used for conditional configuration loading
(defvar hostname (downcase (car (split-string system-name "\\."))))

;; Helpers ---------------------------------------------------------------------

;; stolen from http://stackoverflow.com/a/21767679
(defun load-all (dir)
  (interactive "D")
  (let ((libraries-loaded (mapcar #'file-name-sans-extension
                                  (delq nil (mapcar #'car load-history)))))
    (dolist (file (directory-files dir t ".+\\.elc?$"))
      (let ((library (file-name-sans-extension file)))
        (unless (member library libraries-loaded)
          (load library nil t)
          (push library libraries-loaded))))))

(defun load-package (package &optional config)
  "installs package if not present"
  (if (not (require package nil t))
      (package-install package)))

;; Setup package archives ------------------------------------------------------
(setq package-archives
      '(("gnu"        . "http://elpa.gnu.org/packages/")
	("elpa"       . "http://tromey.com/elpa/")
	("marmalade"  . "http://marmalade-repo.org/packages/")
	("melpa"      . "https://melpa.org/packages/")))

;; Load configuration files ----------------------------------------------------

(add-hook
 'after-init-hook
 '(lambda ()
    (load-all (concat config-dir (file-name-as-directory "auto")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "308eb04bfba22cd158a0927362d3a138653755eb7e82d626088df845c77b59c6" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" default)))
 '(gradle-mode t)
 '(haskell-process-suggest-remove-import-lines t)
 '(org-html-postamble-format
   (quote
    (("en" "<hr /><p class=\"author\">Author: %a (%e)</p>
<p class=\"date\">Date: %d</p>
<p class=\"creator\">%c</p>
<p class=\"validation\">%v</p>"))))
 '(package-selected-packages
   (quote
    (twittering-mode ensime all-the-icons neotree handlebars-mode gdscript-mode svg-clock paredit inf-ruby fish-mode feature-mode quasi-monochrome-theme gradle-mode python-environment rainbow-delimiters dockerfile-mode hacker-typer company-jedi markdown-preview-mode markdown-preview-eww htmlize vue-mode yaml-mode windresize web-mode wanderlust unkillable-scratch typescript-mode toml-mode subatomic-theme smex restclient rainbow-mode racer projectile plantuml-mode org-bullets org-beautify-theme octo-mode nyan-mode nodejs-repl multiple-cursors move-text magit js2-mode js-comint jenkins jekyll-modes jabber idomenu ido-vertical-mode ido-ubiquitous ido-complete-space-or-hyphen highlight-symbol helm groovy-mode glsl-mode git-gutter-fringe flycheck-rust flycheck-haskell expand-region company-ghci color-theme-sanityinc-tomorrow cargo autopair)))
 '(send-mail-function (quote sendmail-send-it))
 '(subatomic-high-contrast t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eshell-prompt ((t (:foreground "#718c00" :weight bold))))
 '(org-document-title ((t (:inherit default :weight bold :font "Source Sans Pro" :height 1.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :font "Source Sans Pro" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :font "Source Sans Pro" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :font "Source Sans Pro" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :font "Source Sans Pro" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :font "Source Sans Pro"))))
 '(org-level-6 ((t (:inherit default :weight bold :font "Source Sans Pro"))))
 '(org-level-7 ((t (:inherit default :weight bold :font "Source Sans Pro"))))
 '(org-level-8 ((t (:inherit default :weight bold :font "Source Sans Pro")))))
