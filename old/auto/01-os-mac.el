
(when (string-match "darwin" (symbol-name system-type))
  ;; (set-frame-font "Menlo-13")
  (set-frame-font "Source Code Pro-15" nil t)

  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier 'meta
        mac-option-modifier 'none))
