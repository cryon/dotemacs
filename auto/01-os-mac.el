
(when (string-match "darwin" (symbol-name system-type))
  ;; (set-frame-font "Menlo-13")
  (set-frame-font "Source Code Pro-15" nil t)

  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier 'meta
        mac-option-modifier 'none))
