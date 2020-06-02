;;; setup-globals --- Setup global configurations
;;; Commentary:
;;; Code:

(defalias 'yes-or-no-p 'y-or-n-p)
(defun noop () "Does nothing." (interactive) (message "disabled command"))

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-q"))

(setq backup-inhibited t)
(setq auto-save-default nil)
(icomplete-mode)
(custom-set-variables
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-major-mode (quote text-mode))
 '(initial-scratch-message "")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(ido-mode t)

(global-set-key (kbd "C-c l") 'toggle-truncate-lines)

;; setup web mode
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; CUA mode
;; - delete-selection and better rectangle-mark-mode only
;; - without CUA key bindings (C-x C-c C-v C-z)
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; Copy - Paste
(setq mouse-drag-copy-region nil) ; stops mouse selection to the kill ring
(setq x-select-enable-primary nil) ; stops copy/paste to primary selection
(setq x-select-enable-clipboard t) ; copy/paste with clipboard
(setq select-active-regions t) ; active region sets primary selection
(global-set-key [mouse-2] 'mouse-yank-primary) ; paste with middle-click

;; Switch list-buffer binding to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Find in files (grep)
(global-set-key (kbd "C-c g") 'helm-projectile-ag)
(global-set-key (kbd "C-c f") 'helm-do-ag)
(global-set-key (kbd "C-c C-g") 'git-grep)

;; Discover mode
(global-discover-mode 1)

;; Fly check
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Shell
(global-set-key (kbd "C-c RET") 'shell)

;; Smartparens
(smartparens-global-mode t)

;; Auto indent on new line
(electric-indent-mode t)

;; Expand region
(global-set-key (kbd "C-M-SPC") 'er/expand-region)

;; UndoTree
(global-undo-tree-mode)

;; Yasnippet
(require 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(yas-reload-all)

;; Translate
(setq-default google-translate-default-source-language "en")
(setq-default google-translate-default-target-language "pt")
(global-set-key (kbd "C-c t p") 'google-translate-at-point)
(global-set-key (kbd "C-c t e") 'google-translate-at-point-reverse)

;; Highlight anything
;; (hl-highlight-mode 1)
(global-set-key (kbd "C-c ; h") 'hl-highlight-thingatpt-local)
(global-set-key (kbd "C-c ; u") 'hl-unhighlight-all-local)

;; Disable auto insert encoding magic comment
(setq ruby-insert-encoding-magic-comment nil)

;; Remove trailling whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Disable paging
(setenv "PAGER" "cat")

(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")

;; Auto revert buffers changed on file system
(global-auto-revert-mode t)

;; Alarm bell
(setq ring-bell-function 'ignore)

;; Default fill column
(setq-default fill-column 98)

;; LSP (language server protocol)
(require 'lsp-mode)
(require 'lsp-ui)
(require 'lsp-clients)
(require 'company-lsp)

(setq-default lsp-ui-sideline-enable nil)
(setq-default lsp-ui-doc-enable nil)
(setq-default lsp-ui-peek-enable nil)
(push 'company-lsp company-backends)

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

(add-hook 'prog-mode-hook #'lsp)

(defvar-local p-lsp-doc-showing nil)

(defun lsp-doc-toggle ()
  (interactive)
  (if p-lsp-doc-showing
      (progn
        (lsp-ui-doc-unfocus-frame)
        (lsp-ui-doc-hide)
        (setq p-lsp-doc-showing nil))
    (lsp-ui-doc-show)
    (setq p-lsp-doc-showing t)))

(defun lsp-doc-toggle-focus ()
  (interactive)
  (if p-lsp-doc-showing
      (progn
        (lsp-ui-doc-focus-frame))
    (lsp-ui-doc-unfocus-frame)))

(global-set-key (kbd "C-c C-i C-i") 'lsp-doc-toggle)
(global-set-key (kbd "C-c C-i C-o") 'lsp-doc-toggle-focus)
(global-set-key (kbd "C-c C-i C-l") 'lsp-ui-imenu)

(provide 'setup-globals)
;;; setup-globals ends here
