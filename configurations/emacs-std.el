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