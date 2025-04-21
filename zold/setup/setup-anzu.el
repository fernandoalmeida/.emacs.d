;;; setup-anzu --- Setup anzu package
;;; Commentary:
;;; Code:
(global-anzu-mode 1)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow")

(custom-set-variables
 '(anzu-mode-lighter "")
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-replace-to-string-separator " => "))

(global-set-key (kbd "M-#") 'anzu-query-replace)
(global-set-key (kbd "C-M-#") 'anzu-query-replace-regexp)

(provide 'setup-anzu)
;;; setup-anzu ends here
