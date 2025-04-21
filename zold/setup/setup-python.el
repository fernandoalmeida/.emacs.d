
;;; setup-python --- Setup python package
;;; Commentary:
;;; Code:

(require 'blacken)
(require 'jedi)
(require 'lsp-jedi)
(require 'pyvenv)
(require 'pyvenv-auto)
(require 'web-mode)

;; setup pyenv
(pyvenv-auto-mode t)

;; setup web mode
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml$" . web-mode))

;; setup jedi
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(setq jedi:tooltip-method nil)

;; setup black
;; (add-hook 'python-mode-hook 'blacken-mode)

(provide 'setup-python)
;;; setup-python ends here
