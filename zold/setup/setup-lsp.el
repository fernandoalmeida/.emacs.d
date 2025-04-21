;;; setup-lsp --- Setup lsp mode(s)
;;; Commentary:
;;; Code:

(use-package lsp-mode
  :straight t
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/.elixir-ls/release")
  (setq lsp-lens-place-position 'above-line)
  (setq lsp-elixir-server-command '("~/.elixir-ls/release/language_server.sh"))
  )

(provide 'setup-lsp)
;;; setup-lsp.el ends here
