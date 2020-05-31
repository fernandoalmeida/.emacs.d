;;; setup-elixir --- Setup elixir mode
;;; Commentary:
;;; Code:
(require 'elixir-mode)
(require 'alchemist)
(require 'web-mode)

(setq alchemist-test-mode-highlight-tests nil)
(setq alchemist-test-status-modeline nil)

(eval-after-load 'flycheck '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)

;; setup web mode
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

(defun custom/new-pipe ()
  "add a new pipe"
  (interactive)
  (progn
    (newline-and-indent)
    (insert "|> ")))
(define-key elixir-mode-map (kbd "C-M-j") 'custom/new-pipe)
(define-key elixir-mode-map (kbd "C-c i") 'elixir-format)

(provide 'setup-elixir)
;;; setup-elixir ends here
