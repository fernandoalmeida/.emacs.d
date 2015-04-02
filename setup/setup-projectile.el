;;; setup-projectile --- Setup projectile package
;;; Commentary:
;;; Code:
(projectile-global-mode)

(setq projectile-enable-caching t)
(setq projectile-indexing-method 'find)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)

(setq projectile-mode-line
  '(:eval (format " [%s]" (projectile-project-name))))

(provide 'setup-projectile)
;;; setup-projectile ends here
