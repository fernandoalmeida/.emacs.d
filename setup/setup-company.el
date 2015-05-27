;;; setup-company --- Setup company mode
;;; Commentary:
;;; Code:

(require 'company)
(global-company-mode)

(define-key company-active-map (kbd "C-h") 'company-show-doc-buffer)
(define-key company-active-map (kbd "C-l") 'company-show-location)
(define-key company-active-map (kbd "C-j") 'company-complete)
(define-key company-active-map (kbd "<tab>") 'company-complete)

(provide 'setup-company)
;;; setup-company ends here
