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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shift-Click select region ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Don't show a stupid font context menu when shift-clicking a buffer.
(global-set-key [S-mouse-1] 'dave-shift-mouse-select)
(global-set-key [S-down-mouse-1] 'ignore)

(defun dave-shift-mouse-select (event)
  "Set the mark and then move point to the position clicked on with the mouse.
   This should be bound to a mouse click event type."
  (interactive "e")
  (mouse-minibuffer-check event)
  (if mark-active (exchange-point-and-mark))
  (set-mark-command nil)
  ;; Use event-end in case called from mouse-drag-region.
  ;; If EVENT is a click, event-end and event-start give same value.
  (posn-set-point (event-end event)))

;;;;;;;;;;;;;;;;;;;;;
;; Initalize       ;;
;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message "")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(which-function-mode t)
(electric-pair-mode t)
