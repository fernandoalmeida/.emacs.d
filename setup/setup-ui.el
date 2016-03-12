;;; setup-ui --- Setup ui
;;; Commentary:
;;; Code:
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode nil)
(put 'scroll-left 'disabled nil)
(setq-default column-number-mode t)
(global-hl-line-mode t)

(load-theme 'hc-zenburn t)
(set-face-background 'region "burlywood4")
(set-face-background 'isearch "brown")
(set-face-background 'lazy-highlight "burlywood4")
(add-to-list 'default-frame-alist '(font . "Monospace 9"))

;; Different backgound color on active/inactive buffers
(add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t))))
(set-face-background 'auto-dim-other-buffers-face "gray10")

;; Line numbers
(add-hook 'prog-mode-hook 'linum-mode)

(require 'highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)
(set-face-background 'highlight-indentation-face "#e3e3e3")
(set-face-background 'highlight-indentation-current-column-face "#393939")

;; Rainbow Mode
(add-hook 'prog-mode-hook 'rainbow-mode)

;; Powerline
(powerline-default-theme)

;; Highlight matching parentheses, braces and brackets
(show-paren-mode t)

;; Show trailing whitespace by default
(add-hook 'prog-mode-hook (setq show-trailing-whitespace t))

;; Clean empty indentation
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; 80 Columns Indicator
(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(setq fci-rule-use-dashes t)
(add-hook 'prog-mode-hook 'turn-on-fci-mode)
(setq fci-rule-color "#666666")

(provide 'setup-ui)
;;; setup-ui ends here
