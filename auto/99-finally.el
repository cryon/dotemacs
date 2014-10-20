;; start emacs daemon
(server-start)

;; default working directory will be the home directory
(cd "~")

;; start an eshell
(eshell)
(rename-buffer "eshell")
