;;; setup-elixir --- Setup elixir mode
;;; Commentary:
;;; Code:
(require 'elixir-mode)
(require 'alchemist)

(setq alchemist-test-mode-highlight-tests nil)
(setq alchemist-test-status-modeline nil)
(setq alchemist-key-command-prefix (kbd "C-c ,"))

(provide 'setup-elixir)
;;; setup-elixir ends here
