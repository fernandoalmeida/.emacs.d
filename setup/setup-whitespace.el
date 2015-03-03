(setq whitespace-style (quote (face trailing lines-tail)))
(global-whitespace-mode 1)
(eval-after-load "whitespace" '(diminish 'global-whitespace-mode))
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)
