;;; setup-diminish --- Setup diminish package
;;; Commentary:
;;; Code:
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "helm" '(diminish 'helm-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "rubocop" '(diminish 'rubocop-mode))
(eval-after-load "robe" '(diminish 'robe-mode))
(eval-after-load "rspec-mode" '(diminish 'rspec-mode))

(provide 'setup-diminish)
;;; setup-diminish ends here
