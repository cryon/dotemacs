
(setq

 ;; Channel name in prompt
 erc-prompt (lambda () (concat (buffer-name) ">"))

 ;; Timestamps
 erc-timestamp-only-if-changed-flag nil
 erc-timestamp-format "[%H:%M:%S] "
 erc-insert-timestamp-function 'erc-insert-timestamp-left

 ;; User information
 erc-user-full-name "John Olsson"
 erc-nick "cryon"
 erc-email-userid "cryon"
 erc-nick-uniquifier "_"

 erc-promt-for-password nil)

;; "dynamic" fill column
(add-hook
 'window-configuration-change-hook
 '(lambda ()
    (setq erc-fill-column (- (window-width) 2))))
