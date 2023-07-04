;;; setup-copilot --- Setup copilot package
;;; Commentary:
;;; Code:

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t
  :hook (prog-mode . copilot-mode)
  :bind (("C-c c" . copilot-complete)
         :map copilot-completion-map
         ("C-g" . 'copilot-clear-overlay)
         ("M-p" . 'copilot-previous-completion)
         ("M-n" . 'copilot-next-completion)
         ("<tab>" . 'copilot-accept-completion)))

(use-package gptel
  :straight t
  :ensure t)

(provide 'setup-copilot)
;;; setup-copilot.el ends here
