;;; setup-dired --- Setup dired package
;;; Commentary:
;;; Code:
(require 'dired)

(define-key dired-mode-map (kbd "C-j") 'dired-find-file)
(define-key dired-mode-map (kbd "C-l") 'dired-up-directory)

(provide 'setup-dired)
;;; setup-dired ends here
