;;; setup-globals --- Setup global configurations
;;; Commentary:
;;; Code:

(defun noop () "Does nothing." (interactive) nil)

;; Custom variables
(custom-set-variables
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message "")
 '(safe-local-variable-values (quote ((encoding . utf-8)))))

;; Change yes/no questions to y/n only
(defalias 'yes-or-no-p 'y-or-n-p)

(icomplete-mode)
(ido-mode t)

;; CUA mode
;; - delete-selection and better rectangle-mark-mode only
;; - without CUA key bindings (C-x C-c C-v C-z)
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; Disable backup
(setq backup-inhibited t)

;; Disable auto save
(setq auto-save-default nil)

;; Auto indent on new line
(electric-indent-mode t)

;; Copy - Paste
(setq mouse-drag-copy-region nil)              ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)             ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t)             ; makes killing/yanking interact with clipboard X11 selection
(setq select-active-regions t)                 ; active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary) ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; Switch list-buffer binding to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Find in files (grep)
(global-set-key (kbd "C-x C-g") 'find-grep)
(global-set-key (kbd "C-c C-g") 'git-grep)

;; Discover mode
(global-discover-mode 1)

;; Fly chceck
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Shell
(global-set-key (kbd "C-c RET") 'shell)

;; Smartparens
(smartparens-global-mode t)

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
