(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      '(("default"

	 ("Shells"
	  (or
	   (mode . shell-mode)
	   (mode . eshell-mode)))

	 ("Programming"
	  (or
	   (mode . c-mode)
	   (mode . c++-mode)
	   (mode . emacs-lisp-mode)
	   (mode . ruby-mode)
	   (mode . python-mode)
	   (mode . js-mode)
	   (mode . css-mode)
	   (mode . xml-mode)
           (mode . nxml-mode)
	   (mode . html-mode)
	   (mode . haskell-mode)
           (mode . haskell-cabal-mode)
           (mode . rust-mode)
	   (mode . perl-mode)
	   (mode . sql-mode)
	   (mode . java-mode)
	   (mode . scala-mode)))

         ("Jabber"
          (or
           (mode . jabber-browse-mode)
           (mode . jabber-chat-mode)
           (mode . jabber-roster-mode)))

	 ("IRC - Channels"
	  (mode . erc-mode)
	  (name . "^\\#"))

	 ("IRC - Servers"
	  (mode . erc-mode))

	 ("Org"
	  (mode . org-mode))

	 ("Mail & News"
	  (or
	   (mode . message-mode)
	   (mode . bbdb-mode)
	   (mode . mail-mode)
	   (mode . gnus-group-mode)
	   (mode . gnus-summary-mode)
	   (mode . gnus-article-mode)
	   (name . "^\\.bbdb$")
	   (name . "^\\.newsrc-dribble")))

	 ("Magit"
	  (name . "\*magit"))

	 ("Emacs"
	  (or
	   (mode . help-mode)
	   (mode . occur-mode)
	   (mode . Info-mode)
	   (mode . bookmark-bmenu-mode)
	   (name . "^\\*Apropos\\*$")
	   (name . "^.emacs$")
	   (name . "el$")
	   (name . "^\\*scratch\\*$")
	   (name . "^\\*Packages\\*$")
	   (name . "^\\*Messages\\*$")
	   (name . "^\\*Completions\\*$")
	   (name . "^\\*Compile-Log\\*$"))))))

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-default-sorting-mode 'major-mode)
(setq ibuffer-expert t)

(define-ibuffer-column human-size
  (:name "Size" :inline t)
  (let* ((kibibyte 1024)
	 (mebibyte (* kibibyte kibibyte))
	 (size (buffer-size)))
    (cond ((> size mebibyte)
	   (format "%7.2fMiB" (/ size (float mebibyte))))
	  ((> size kibibyte)
	   (format "%7.2fKiB" (/ size (float kibibyte))))
	  (t (format "%8d" size)))))

(setq ibuffer-formats
      '((mark modified read-only " "
	      (name 17 17 :left :elide)
	      " "
	      (human-size 10 -1 :right)
	      " "
	      (mode 16 16 :left :elide)
	      " "
	      filename-and-process)))

(add-hook 'ibuffer-mode-hook
	  (lambda ()
	    (ibuffer-auto-mode 1)
	    (ibuffer-switch-to-saved-filter-groups "default")))
