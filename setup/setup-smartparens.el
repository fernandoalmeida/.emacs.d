;;; setup-smartscan --- Setup smartscan package
;;; Commentary:
;;; Code:
(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

(define-key sp-keymap (kbd "C-M-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-M-e") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-b") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-f") 'sp-down-sexp)

(define-key sp-keymap (kbd "C-M-d") 'sp-splice-sexp-killing-forward)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)

(define-key sp-keymap (kbd "C-M-S-d") 'sp-unwrap-sexp)
(define-key sp-keymap (kbd "C-M-S-<backspace>") 'sp-backward-unwrap-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

;;; markdown-mode
(sp-with-modes '(markdown-mode gfm-mode rst-mode)
  (sp-local-pair "*" "*" :bind "C-*"))

(provide 'setup-smartparens)
;;; setup-smartparens ends here
