;;; setup-whitespace --- Setup whitespace
;;; Commentary:
;;; Code:
(setq whitespace-line-column 98)
(setq whitespace-style (quote (face trailing lines-tail)))
(global-whitespace-mode 1)
(eval-after-load "whitespace" '(diminish 'global-whitespace-mode))
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

(provide 'setup-whitespace)
;;; setup-whitespace ends here
