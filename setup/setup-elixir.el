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
;; (use-package polymode
;;   :straight t
;;   :ensure t
;;   :mode ("\.ex$" . poly-elixir-web-mode)
;;   :config
;;   (define-hostmode poly-elixir-hostmode :mode 'elixir-mode)
;;   (define-innermode poly-liveview-expr-elixir-innermode
;;     :mode 'web-mode
;;     :head-matcher (rx line-start (* space) "~H" (= 3 (char "\"'")) line-end)
;;     :tail-matcher (rx line-start (* space) (= 3 (char "\"'")) line-end)
;;     :head-mode 'host
;;     :tail-mode 'host
;;     :allow-nested nil
;;     :keep-in-mode 'host
;;     :fallback-mode 'host)
;;   (define-polymode poly-elixir-web-mode
;;     :hostmode 'poly-elixir-hostmode
;;     :innermodes '(poly-liveview-expr-elixir-innermode))
;;   )
;; (setq web-mode-engines-alist '(("elixir" . "\\.ex\\'")))

(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.heex\\'" . web-mode))
(sp-with-modes '(web-mode)
  (sp-local-pair "<" nil :actions nil)
  (sp-local-pair "% " " %"
                 :unless '(sp-in-string-p)
                 :post-handlers '(((lambda (&rest _ignored)
                                     (just-one-space)
                                     (save-excursion (insert " ")))
                                   "SPC" "=" "#")))
  (sp-local-pair "<% " " %>" :insert "C-c %")
  (sp-local-pair "<%= " " %>" :insert "C-c =")
  (sp-local-pair "<%# " " %>" :insert "C-c #")
  (sp-local-pair "<-" ""))

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
