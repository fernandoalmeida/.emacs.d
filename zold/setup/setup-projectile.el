;;; setup-projectile --- Setup projectile package
;;; Commentary:
;;; Code:
(require 'projectile)

(projectile-mode)

;; Ignore `.log` directory and `openapi.json` file by default
(add-to-list 'projectile-globally-ignored-files "*/*/openapi.json")
(add-to-list 'projectile-globally-ignored-directories ".log")

(setq projectile-enable-caching t)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)

(setq projectile-mode-line
  '(:eval (format " [%s]" (projectile-project-name))))

(provide 'setup-projectile)
;;; setup-projectile ends here
