;;; setup-theme --- Setup theme
;;; Commentary:
;;; Code:
(load-theme 'zenburn t)

(set-face-background 'hl-line "#2c3537")
(set-face-background 'isearch "brown")
(set-face-background 'lazy-highlight "burlywood4")
(add-to-list 'default-frame-alist '(font . "Monospace 9"))

(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3e3")
(set-face-background 'highlight-indentation-current-column-face "#393939")

(provide 'setup-theme)
;;; setup-theme ends here
