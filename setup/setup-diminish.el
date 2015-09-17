;;; setup-diminish --- Setup diminish package
;;; Commentary:
;;; Code:
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "helm" '(diminish 'helm-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "rubocop" '(diminish 'rubocop-mode))
(eval-after-load "rspec-mode" '(diminish 'rspec-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "guide-key" '(diminish 'guide-key-mode))
(eval-after-load "hideshow" '(diminish 'hs-minor-mode))

(diminish 'yas-minor-mode)
(diminish 'undo-tree-mode)
(diminish 'smartparens-mode)
(diminish 'company-mode)

(provide 'setup-diminish)
;;; setup-diminish ends here
