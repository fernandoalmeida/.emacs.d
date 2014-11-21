;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Emacs standard features
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Filesets support
(filesets-init)

;; Disable backup
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; Turn off tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Scrollbar disabled
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode nil)

;; Horizontal scrolling
(put 'scroll-left 'disabled nil)

;; Highlight matching parentheses, braces and brackets.
(show-paren-mode t)

;; Turn on line truncation to better visual identation
(setq default-truncate-lines t)

;; Show trailing whitespace by default
(setq-default show-trailing-whitespace t)

;; Save Sessions on Exit
(desktop-save-mode 1)

(defun my-mark-word (N)
  (interactive "p")
  (if (and
       (not (eq last-command this-command))
       (not (eq last-command 'my-mark-word-backward)))
      (set-mark (point)))
  (forward-word N))


(defun my-mark-word-backward (N)
  (interactive "p")
  (if (and
       (not (eq last-command this-command))
       (not (eq last-command 'my-mark-word)))
      (set-mark (point)))
  (backward-word N))

;; Shift-Click select region
(global-set-key [S-down-mouse-1] 'ignore)
(global-set-key [S-mouse-1] 'shift-mouse-select)
(defun shift-mouse-select (event)
  (interactive "e")
  (mouse-minibuffer-check event)
  (if mark-active (exchange-point-and-mark))
  (set-mark-command nil)
  (posn-set-point (event-end event)))

(custom-set-variables
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message "")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(which-function-mode t)
(electric-pair-mode t)
(electric-indent-mode t)
