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
(setq current-line-background "dark slate gray")
(set-face-background 'region "dark cyan")
(set-face-background 'isearch "brown")
(set-face-background 'lazy-highlight "dark cyan")
(add-to-list 'default-frame-alist '(font . "Monospace 9"))
(set-face-background 'hl-line current-line-background)
(set-face-background 'helm-selection current-line-background)
(add-hook 'magit-mode-hook
	  (lambda ()
	    (set-face-background 'magit-diff-file-heading-highlight
				 current-line-background)))

;; Different backgound color on active/inactive buffers
(add-hook 'after-init-hook (lambda ()
  (when (fboundp 'auto-dim-other-buffers-mode)
    (auto-dim-other-buffers-mode t)
    (set-face-background 'auto-dim-other-buffers-face "gray10"))))

;; Line numbers
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'markdown-mode-hook 'linum-mode)

(require 'highlight-indentation)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)
(set-face-background 'highlight-indentation-face "#e3e3e3")
(set-face-background 'highlight-indentation-current-column-face "#393939")

;; Rainbow Mode
(add-hook 'prog-mode-hook 'rainbow-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(custom-set-faces '(rainbow-delimiters-depth-1-face ((t (:foreground "DeepSkyBlue1")))))
(custom-set-faces '(rainbow-delimiters-depth-2-face ((t (:foreground "YellowGreen")))))
(custom-set-faces '(rainbow-delimiters-depth-3-face ((t (:foreground "gold1")))))
(custom-set-faces '(rainbow-delimiters-depth-4-face ((t (:foreground "tomato")))))
(custom-set-faces '(rainbow-delimiters-depth-5-face ((t (:foreground "DeepPink")))))
(custom-set-faces '(rainbow-delimiters-depth-6-face ((t (:foreground "white")))))

;; Powerline
(powerline-default-theme)

;; Highlight matching parentheses, braces and brackets
(show-paren-mode t)

;; Show trailing whitespace by default
(add-hook 'prog-mode-hook (setq show-trailing-whitespace t))

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
