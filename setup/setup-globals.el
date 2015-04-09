;;; setup-globals --- Setup global configurations
;;; Commentary:
;;; Code:

(defun noop () "Does nothing." (interactive) nil)
(defalias 'yes-or-no-p 'y-or-n-p)

(setq backup-inhibited t)
(setq auto-save-default nil)
(icomplete-mode)
(custom-set-variables
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message "")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

(ido-mode t)

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
(global-set-key (kbd "C-x C-g") 'find-grep)
(global-set-key (kbd "C-c C-g") 'git-grep)

;; Discover mode
(global-discover-mode 1)

;; Fly chceck
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Shell
(global-set-key (kbd "C-c RET") 'shell)

;; Smartparens
(smartparens-global-mode t)

;; Auto indent on new line
(electric-indent-mode t)

;; Expand region
(global-set-key (kbd "C-;") 'er/expand-region)

;; UndoTree
(global-undo-tree-mode)

;; Yasnippet
(yas-global-mode 1)

;; Auto Complete
(global-auto-complete-mode)

;; Google translate
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pt")
(global-set-key (kbd "C-c t t") 'google-translate-at-point)
(global-set-key (kbd "C-c t r") 'google-translate-at-point-reverse)

(provide 'setup-globals)
;;; setup-globals ends here
