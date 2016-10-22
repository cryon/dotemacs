
;; Correctly identify the prompt when using MariaDB
(sql-set-product-feature
 'mysql :prompt-regexp
 "^\\(MariaDB\\|MySQL\\) \\[.*\\]> ")
