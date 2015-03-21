;;; setup-neotree --- Setup neotree package
;;; Commentary:
;;; Code:
(global-set-key (kbd "C-c C-n") 'neotree-projectile-action)
(global-set-key (kbd "C-c n") 'neotree)
(setq neo-persist-show nil)

(provide 'setup-neotree)
;;; setup-neotree ends here
