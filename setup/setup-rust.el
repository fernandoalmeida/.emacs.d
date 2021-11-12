;;; setup-rust -- Setup rust mode
;;; Commentary:
;;; Code:

(require 'rust-mode)

(rust-enable-format-on-save)

(define-key rust-mode-map (kbd "C-c ,") 'rust-test)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'company-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(provide 'setup-rust)
;;; setup-rust ends here
