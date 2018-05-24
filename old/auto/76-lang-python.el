(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(setq py-python-command "python3.6")
(setq python-shell-interpreter "python3.6")

(add-hook 'python-mode-hook 'my/python-mode-hook)
