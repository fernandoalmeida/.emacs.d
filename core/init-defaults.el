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

;; Save Sessions on Exit
(desktop-save-mode 1)

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

;; Auto pair  parentheses, braces and brackets
(electric-pair-mode t)

;; Auto indent on new line
(electric-indent-mode t)

;; Disable paging
(setenv "PAGER" "cat")

;; Reuse buffers between frames
(setq-default display-buffer-reuse-frames t) 
