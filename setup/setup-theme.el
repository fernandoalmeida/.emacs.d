;;; setup-theme --- Setup theme
;;; Commentary:
;;; Code:
(load-theme 'zenburn t)

(set-face-background 'hl-line "#2c3537")
(set-face-background 'isearch "brown")
(set-face-background 'lazy-highlight "burlywood4")
(add-to-list 'default-frame-alist '(font . "Monospace 9"))

(provide 'setup-theme)
;;; setup-theme ends here
