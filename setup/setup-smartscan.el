;;; setup-smartscan --- Setup smartscan package
;;; Commentary:
;;; Code:
(global-smartscan-mode 1)
(global-set-key (kbd "C-.") 'smartscan-symbol-go-forward)
(global-set-key (kbd "C-,") 'smartscan-symbol-go-backward)

(provide 'setup-smartscan)
;;; setup-smartscan ends here
