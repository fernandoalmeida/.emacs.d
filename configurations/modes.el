;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Modes configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-linum-mode 1)
(global-hl-line-mode t)
(partial-completion-mode)
(icomplete-mode)
(cua-mode t)
(ido-mode t)

;; Ruby mode files
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Textile mode
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

;; Javascript
;; (autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js.*$" . js2-mode))

;; Yaml mode
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; PHP mode
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; Scss mode
(add-to-list 'auto-mode-alist '("\\.scss.*\\'" . scss-mode))

;; Less CSS mode
(add-to-list 'auto-mode-alist '("\\.less.*\\'" . less-css-mode))

;; Zen Coding mode
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'haml-mode-hook 'zencoding-mode)

;; Highlight Indentation mode
(add-hook 'sgml-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'haml-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'ruby-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'emacs-lisp-mode-hook 'highlight-indentation-current-column-mode)
