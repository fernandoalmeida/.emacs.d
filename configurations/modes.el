;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Modes configurations
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-linum-mode 1)
(setq-default column-number-mode t)
(global-hl-line-mode t)
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
(setq-default js2-idle-timer-delay 0.5)
(setq-default js2-global-externs '("module"
				   "require"
				   "buster"
				   "sinon"
				   "assert"
				   "refute"
				   "setTimeout"
				   "clearTimeout"
				   "setInterval"
				   "clearInterval"
				   "location"
				   "__dirname"
				   "console"
				   "JSON"
				   "$"
				   "Backbone"
				   "_"))

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

;; HAML mode
(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

;; Markdown mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text$\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$\\'" . markdown-mode))

(defun auto-fci-mode (&optional unused)
  (if (> (frame-width) 80)
      (fci-mode 1)
    (fci-mode 0))
  )
