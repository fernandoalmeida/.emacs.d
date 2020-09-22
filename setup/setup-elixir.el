;;; setup-elixir --- Setup elixir mode
;;; Commentary:
;;; Code:
(require 'elixir-mode)
(require 'alchemist)
(require 'web-mode)

;; setup alchemist
(setq alchemist-test-mode-highlight-tests nil)
(setq alchemist-test-status-modeline nil)
(add-hook 'magit-mode-hook 'alchemist-mode)
(add-hook 'mix-mode-hook 'alchemist-mode)

(eval-after-load 'flycheck '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)

;; setup mix
(setq compilation-scroll-output nil)
(add-hook 'elixir-mode-hook 'mix-minor-mode)
(add-hook 'magit-mode-hook 'mix-minor-mode)
(add-hook 'mix-mode-hook 'mix-minor-mode)

;; setup web mode
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))

;; setup formatter
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil 'local)))

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
