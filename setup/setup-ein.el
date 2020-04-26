;;; setup-ein --- Setup ein package
;;; Commentary:
;;; Code:
(require 'ein)
(require 'poly-ein)
(require 'diminish)

(diminish 'poly-ein-mode)
(add-hook 'poly-ein-mode-hook 'linum-mode)
(define-key poly-ein-mode-map (kbd "M-p") 'ein:worksheet-goto-prev-input-km)
(define-key poly-ein-mode-map (kbd "M-n") 'ein:worksheet-goto-next-input-km)

(provide 'setup-ein)
;;; setup-ein ends here
