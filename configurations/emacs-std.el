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

;; Clear whitespaces on backspaced line
(defun kill-and-join-forward (&optional arg)
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1)
             (kill-line arg))
    (kill-line arg)))

;; Save Sessions on Exit
(desktop-save-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hide/Show blocks
;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; automatic activation
(load-library "hideshow")
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'js2-mode-hook        'hs-minor-mode)
(add-hook 'javascript-mode-hook 'hs-minor-mode)
(add-hook 'ruby-mode-hook       'hs-minor-mode)

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (overlay-put ov 'help-echo
		 (buffer-substring (overlay-start ov)
				   (overlay-end ov)))))

(setq hs-set-up-overlay 'display-code-line-counts)

;; expand block using goto-line
(defadvice goto-line (after expand-after-goto-line
			    activate compile)
  "hideshow-expand affected block when using goto-line in a collapsed buffer"
  (save-excursion
    (hs-show-block)))

;; hideshow on ruby-mode
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(module\\|class\\|def\\|if\\|unless\\|do\\|{\\)" "\\(end\\|end\\|end\\|end\\|end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

;; Ruby hash/array indentation
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-arglist nil)

;; Fix closing parentheses indentation
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; hideshow all comments
(defun hs-hide-all-comments ()
  "Hide all top level blocks, if they are comments, displaying only first line.
Move point to the beginning of the line, and run the normal hook
`hs-hide-hook'.  See documentation for `run-hooks'."
  (interactive)
  (hs-life-goes-on
   (save-excursion
     (unless hs-allow-nesting
       (hs-discard-overlays (point-min) (point-max)))
     (goto-char (point-min))
     (let ((spew (make-progress-reporter "Hiding all comment blocks..."
                                         (point-min) (point-max)))
           (re (concat "\\(" hs-c-start-regexp "\\)")))
       (while (re-search-forward re (point-max) t)
         (if (match-beginning 1)
	     ;; found a comment, probably
	     (let ((c-reg (hs-inside-comment-p)))
	       (when (and c-reg (car c-reg))
		 (if (> (count-lines (car c-reg) (nth 1 c-reg)) 1)
		     (hs-hide-block-at-point t c-reg)
		   (goto-char (nth 1 c-reg))))))
         (progress-reporter-update spew (point)))
       (progress-reporter-done spew)))
   (beginning-of-line)
   (run-hooks 'hs-hide-hook)))

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
