;;; setup-emmet-mode -- Setup emmet-mode
;;; Commentary:
;;; Code:
(require 'emmet-mode)

(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'rjsx-mode-hook  'emmet-mode)

(eval-after-load 'emmet-mode
  '(progn
     (define-key emmet-mode-keymap (kbd "C-j") 'newline-and-indent)
     (define-key emmet-mode-keymap (kbd "<tab>")
       (lambda ()
	 (interactive)
	 (emmet-expand-line nil)
	 (indent-according-to-mode)))))

(setq emmet-expand-jsx-className? t)

(provide 'setup-emmet-mode)
;;; setup-emmet-mode ends here
