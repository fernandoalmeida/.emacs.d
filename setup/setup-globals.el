;;; setup-globals --- Setup global configurations
;;; Commentary:
;;; Code:

;; Discover mode
(global-discover-mode 1)

;; Fly chceck
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Powerline
(powerline-default-theme)

;; Clean empty indentation
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Shell
(global-set-key (kbd "C-c RET") 'shell)

;; Smartparens
(smartparens-global-mode t)

(provide 'setup-globals)
;;; setup-globals ends here
