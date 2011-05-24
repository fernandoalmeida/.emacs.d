;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Emacs standard features
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn off tool-bar
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Scrollbar right
(setq scroll-bar-mode-explicit t)
(set-scroll-bar-mode `right)

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
