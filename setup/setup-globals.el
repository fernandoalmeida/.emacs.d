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
(global-set-key (kbd "C-c f") 'find-grep)
(global-set-key (kbd "C-c g") 'git-grep)

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
(global-set-key (kbd "C-M-SPC") 'er/expand-region)

;; UndoTree
(global-undo-tree-mode)

;; Yasnippet
(require 'yasnippet)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(yas-reload-all)

;; Google translate
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "pt")
(setq google-translate-translation-directions-alist '(("en" . "pt") ("pt" . "en")))
(global-set-key (kbd "C-c t p") 'google-translate-at-point)
(global-set-key (kbd "C-c t e") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c t t") 'google-translate-smooth-translate)

;; HideShow mode
(add-hook 'prog-mode-hook 'hs-minor-mode)
(global-set-key (kbd "C-c C-h C-h") 'hs-toggle-hiding)
(global-set-key (kbd "C-c C-h C-b") 'hs-hide-block)
(global-set-key (kbd "C-c C-h C-S-b") 'hs-show-block)
(global-set-key (kbd "C-c C-h C-a") 'hs-hide-all)
(global-set-key (kbd "C-c C-h C-S-a") 'hs-show-all)

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
      browse-url-generic-program "conkeror")

;; Alarm bell
(setq ring-bell-function 'ignore)

;; Default fill column
(setq-default fill-column 80)

(provide 'setup-globals)
;;; setup-globals ends here
