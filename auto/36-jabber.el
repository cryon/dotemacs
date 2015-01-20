;; server settings
(setq
 jabber-account-list
 `((,secret-jabber-username
    (:password . ,secret-jabber-password))))

;; general
(setq jabber-auto-reconnect t
      jabber-chat-buffer-format "*-jabber-%n-*"
      jabber-roster-buffer "*-jabber-*"
      jabber-roster-line-format "%c %-25n %u %-8s (%r)")

;; history
(setq
 jabber-history-enabled t
 jabber-use-global-history nil
 jabber-backlog-number 50
 jabber-backlog-days 30)

;; do not distub if someone changes status
(setq
 jabber-alert-presence-message-function
 (lambda (who oldstatus newstatus statustext) nil))

;; custom prompt
(setq my-chat-prompt "[%t] %n: ")
(setq
 jabber-chat-foreign-prompt-format my-chat-prompt
 jabber-chat-local-prompt-format my-chat-prompt
 jabber-groupchat-prompt-format my-chat-prompt
 jabber-muc-private-foreign-prompt-format "[%t] %g/%n> ")

;; highlight urls
(add-hook 'jabber-chat-mode-hook 'goto-address)

;; show my own status in the chat header line (if not online)
(setq jabber-chat-header-line-format
      '(" " (:eval (jabber-jid-displayname jabber-chatting-with))
        " " (:eval (jabber-jid-resource jabber-chatting-with)) "\t";
        (:eval (let ((buddy (jabber-jid-symbol jabber-chatting-with)))
                 (propertize
                  (or
                   (cdr (assoc (get buddy 'show) jabber-presence-strings))
                   (get buddy 'show))
                  'face
                  (or (cdr (assoc (get buddy 'show) jabber-presence-faces))
                      'jabber-roster-user-online))))
        "\t" (:eval (get (jabber-jid-symbol jabber-chatting-with) 'status))
        (:eval (unless (equal "" *jabber-current-show*)
                 (concat "\t You're " *jabber-current-show*
                         " (" *jabber-current-status* ")")))))

;; notifications plx!
(add-hook 'focus-out-hook (lambda () (setq os-frame-focus 'nil)))
(add-hook 'focus-in-hook  (lambda () (setq os-frame-focus 't)))

(defun notify (title message)
  "Show a message with `terminal-notifier-command`."
  (start-process "terminal-notifier"
                 "*terminal-notifier*"
                 "/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier"
                 "-title" title
                 "-message" message
                 "-activate" "org.gnu.Emacs"
                 "-sender" "org.gnu.Emacs"
                 "-sound"  "Tink"))

(defun notify-jabber-message (from buf text proposed-alert)
  (when (or (not (memq (selected-window) (get-buffer-window-list buf)))
            (not os-frame-focus))
    (if (jabber-muc-sender-p from)
        (notify (format "(PM) %s"
                        (jabber-jid-displayname (jabber-jid-user from)))
                (format "%s: %s" (jabber-jid-resource from) text)))
    (notify (format "%s" (jabber-jid-displayname from))
            text)))

(add-hook 'jabber-alert-message-hooks 'notify-jabber-message)
