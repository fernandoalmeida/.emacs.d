;;; setup-nix --- Setup nix mode package
;;; Commentary:
;;; Code:
(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))

(provide 'setup-nix)
;;; setup-nix.el ends here
