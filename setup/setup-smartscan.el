;;; setup-smartscan --- Setup smartscan package
;;; Commentary:
;;; Code:
(smartscan-mode 1)
(global-set-key (kbd "C-.") 'smartscan-symbol-go-forward)
(global-set-key (kbd "C-,") 'smartscan-symbol-go-backward)

(provide 'setup-smartscan)
;;; setup-smartscan ends here
