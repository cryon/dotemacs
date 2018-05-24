
;; Correctly identify the prompt when using MariaDB
(require 'sql)
(sql-set-product-feature
 'mysql :prompt-regexp
 "^\\(MariaDB\\|MySQL\\) \\[.*\\]> ")
