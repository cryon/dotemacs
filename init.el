;; Globals ---------------------------------------------------------------------

;; directory containing this init script
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

