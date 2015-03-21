;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs core features customizations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom variables
(custom-set-variables
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message "")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

;; Change yes/no questions to y/n only
(defalias 'yes-or-no-p 'y-or-n-p)

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

;; Turn on line truncation to better visual identation
;; (setq default-truncate-lines t)

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

;; Switch list-buffer binding to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Find in files (grep)
(global-set-key (kbd "C-x C-g") 'find-grep)
(global-set-key (kbd "C-c C-g") 'git-grep)

;; Reversible C-x 1
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)
