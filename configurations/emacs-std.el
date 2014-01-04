;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Emacs standard features
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn off tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Scrollbar right
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

;; Horizontal scrolling
(put 'scroll-left 'disabled nil)

;; Turn on line truncation to better visual identation
(setq default-truncate-lines t)

;; Auto Indentation
(define-key global-map (kbd "RET") 'newline-and-indent)
(dolist (command '(yank yank-pop))
 (eval `(defadvice ,command (after indent-region activate)
          (and (not current-prefix-arg)
               (member major-mode '(emacs-lisp-mode lisp-mode
                                                    clojure-mode    scheme-mode
                                                    haskell-mode    ruby-mode
                                                    rspec-mode      python-mode
                                                    c-mode          c++-mode
                                                    objc-mode       latex-mode
                                                    plain-tex-mode	html-mode))
               (let ((mark-even-if-inactive transient-mark-mode))
                 (indent-region (region-beginning) (region-end) nil))))))

;; Clear whitespaces on backspaced line
(defun kill-and-join-forward (&optional arg)
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1)
             (kill-line arg))
    (kill-line arg)))

;; Change cursor color according to mode; inspired by
;; http://www.emacswiki.org/emacs/ChangingCursorDynamically
(setq djcb-read-only-color       "black")
;; valid values are t, nil, box, hollow, bar, (bar . WIDTH), hbar,
;; (hbar. HEIGHT); see the docs for set-cursor-type

(setq djcb-read-only-cursor-type 'hbar)
(setq djcb-overwrite-color       "red")
(setq djcb-overwrite-cursor-type 'box)
(setq djcb-normal-color          "black")
(setq djcb-normal-cursor-type    'bar)

(defun djcb-set-cursor-according-to-mode ()
  "change cursor color and type according to some minor modes."

  (cond
   (buffer-read-only
    (set-cursor-color djcb-read-only-color)
    (setq cursor-type djcb-read-only-cursor-type))
   (overwrite-mode
    (set-cursor-color djcb-overwrite-color)
    (setq cursor-type djcb-overwrite-cursor-type))
   (t 
    (set-cursor-color djcb-normal-color)
    (setq cursor-type djcb-normal-cursor-type))))

(add-hook 'post-command-hook 'djcb-set-cursor-according-to-mode)

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
(add-hook 'javascript-mode-hook        'hs-minor-mode)
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
;; Flymake Errline ;;
;;;;;;;;;;;;;;;;;;;;;
(custom-set-faces
 '(flymake-errline ((((class color)) (:background "#FFCFD5"))))
 '(flymake-warnline ((((class color)) (:background "#FFEBCF")))))