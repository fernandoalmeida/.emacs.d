;;; setup-javascript --- Setup javascript mode
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . typescript-mode))
(setq-default indent-tabs-mode nil)
(setq-default js2-basic-offset 2)
(setq js-indent-level 2)

(provide 'setup-javascript)
;;; setup-javascript ends here
