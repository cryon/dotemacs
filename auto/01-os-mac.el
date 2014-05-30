
(when (string-match "darwin" (symbol-name system-type))  
  (set-frame-font "Inconsolata-15")
  
  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier 'meta
        mac-option-modifier 'none))
