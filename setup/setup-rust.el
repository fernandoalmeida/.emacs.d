;;; setup-rust -- Setup rust mode
;;; Commentary:
;;; Code:

(require 'rust-mode)

(rust-enable-format-on-save)

(define-key rust-mode-map (kbd "C-c ,") 'rust-test)

(provide 'setup-rust)
;;; setup-rust ends here
