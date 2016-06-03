;;; setup-ruby --- Setup ruby mode and relateds
;;; Commentary:
;;; Code:

;; Rspec
(add-hook 'magit-mode-hook 'rspec-mode)
(add-hook 'shell-mode-hook 'rspec-mode)
(add-hook 'ruby-mode-hook 'rspec-mode)
(add-hook 'inf-ruby-mode-hook 'rspec-mode)
(setq rspec-use-rake-when-possible nil)
(setq rspec-primary-source-dirs '("app"))

;; Robe / Inf Ruby
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; Rbenv
(global-rbenv-mode)

;; Rubocop
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; Ruby mode files/extensions mapping
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.god$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.env$" . shell-script-mode))

;; Hash/array indentation
(setq ruby-deep-indent-paren nil)
(setq ruby-deep-indent-paren-style nil)
(setq ruby-deep-arglist nil)

(global-set-key (kbd "C-c b") 'custom/bundle-open)

;; identation fixes
(setq
 ruby-align-chained-calls nil
 ruby-align-to-stmt-keywords nil
 ruby-deep-indent-paren nil
 ruby-deep-indent-paren-style nil
 ruby-use-smie nil)

;; Fix closing parentheses indentation
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

(provide 'setup-ruby)
;;; setup-ruby ends here
