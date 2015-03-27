;;; setup-globals --- Setup global configurations
;;; Commentary:
;;; Code:

(defun noop () "Does nothing." (interactive) nil)

;; Custom variables
(custom-set-variables
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message "")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

;; Change yes/no questions to y/n only
(defalias 'yes-or-no-p 'y-or-n-p)

(global-linum-mode 1)
(setq-default column-number-mode t)
(global-hl-line-mode t)
(icomplete-mode)
(cua-mode t)
(ido-mode t)

;; Disable backup
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; Scrollbar disabled
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode nil)

;; Horizontal scrolling
(put 'scroll-left 'disabled nil)

;; Highlight matching parentheses, braces and brackets
(show-paren-mode t)

;; Show trailing whitespace by default
(add-hook 'prog-mode-hook (setq show-trailing-whitespace t))

;; Turn off tool bar
(tool-bar-mode -1)

;; Turn off menu bar
(menu-bar-mode -1)

;; Uniquify buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Auto indent on new line
(electric-indent-mode t)

;; Disable paging
(setenv "PAGER" "cat")

;; Reuse buffers between frames
(setq-default display-buffer-reuse-frames t) 

;; Buffer Navigation
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-down] 'windmove-down)
(global-set-key [M-up] 'windmove-up)

;; Frame Navigation
(global-set-key (kbd "C-c o") 'other-frame)
(global-set-key [M-S-left] 'other-frame)
(global-set-key [M-S-right] 'other-frame)

;; Copy - Paste
(setq mouse-drag-copy-region nil)              ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)             ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t)             ; makes killing/yanking interact with clipboard X11 selection
(setq select-active-regions t)                 ; active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary) ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; Highlight Indentation mode
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)

;; Switch list-buffer binding to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Find in files (grep)
(global-set-key (kbd "C-x C-g") 'find-grep)
(global-set-key (kbd "C-c C-g") 'git-grep)

;; Reversible C-x 1
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;; Discover mode
(global-discover-mode 1)

;; Fly chceck
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Git Emacs
(add-to-list 'load-path "~/.emacs.d/vendor/git-emacs")
(require 'git-emacs)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Powerline
(powerline-default-theme)

;; Clean empty indentation
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Shell
(global-set-key (kbd "C-c RET") 'shell)

;; Smartparens
(smartparens-global-mode t)

;; UndoTree
(global-undo-tree-mode)

;; Yasnippet
(yas-global-mode 1)

;; Auto Complete
(global-auto-complete-mode)

;; Rainbow Mode
(add-hook 'prog-mode-hook 'rainbow-mode)

;; 80 Columns Indicator
(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(setq fci-rule-use-dashes t)
(add-hook 'prog-mode-hook 'turn-on-fci-mode)

;; Google translate
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pt")
(global-set-key (kbd "C-c t t") 'google-translate-at-point)
(global-set-key (kbd "C-c t r") 'google-translate-at-point-reverse)

(provide 'setup-globals)
;;; setup-globals ends here
