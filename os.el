
(let* ((os (symbol-name system-type))
       (gnu/linux   (string-match "gnu/linux" os))
       (osx         (string-match "darwin" os))
       (windows     (string-match "windows" os)))
  (when gnu/linux
    (set-frame-font "Consolas-11"))

  (when osx
    (set-frame-font "Inconsolata-15")

    (setq mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier 'none))

  (when windows
    (set-frame-font "Consolas-10")))
