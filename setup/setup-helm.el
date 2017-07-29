;;; setup-helm --- Setup helm mode and addons
;;; Commentary:
;;; Code:
(helm-mode t)

(require 'helm)
(require 'helm-ag)
(require 'helm-projectile)
(require 'helm-swoop)

(setq helm-quick-update t
      helm-buffers-fuzzy-matching t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 4
      helm-ff-file-name-history-use-recentf t
      helm-exit-idle-delay 0.01
      helm-ff-transformer-show-only-basename nil
      helm-ls-git-show-abs-or-relative 'relative
      helm-full-frame t
      helm-buffer-max-length 50
      helm-bookmark-show-location t
      helm-projectile-sources-list '(helm-source-projectile-buffers-list
				     helm-source-projectile-files-list))

(custom-set-variables
 '(helm-ag-base-command "ag --nocolor --nogroup --smart-case --hidden --search-binary")
 '(helm-ag-insert-at-point t))

(autoload 'helm-descbinds      "helm-descbinds" t)
(autoload 'helm-eshell-history "helm-eshell"    t)
(autoload 'helm-esh-pcomplete  "helm-eshell"    t)

(add-hook 'eshell-mode-hook
          '(lambda ()
	     (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history)))

(global-unset-key (kbd "C-x c"))
(global-set-key   (kbd "M-x")     'helm-M-x)
(global-set-key   (kbd "M-y")     'helm-show-kill-ring)

(global-set-key   (kbd "C-x b")   'helm-buffers-list)
(global-set-key   (kbd "C-x f")   'helm-projectile)
(global-set-key   (kbd "C-x C-f") 'helm-find-files)
(global-set-key   (kbd "C-c b")   'helm-filtered-bookmarks)

(global-set-key   (kbd "C-c h")   'helm-command-prefix)

(global-set-key   (kbd "C-h a")   'helm-apropos)
(global-set-key   (kbd "C-h i")   'helm-info-emacs)
(global-set-key   (kbd "C-h b")   'helm-descbinds)

;; More familiar helm find-file navigation (from Renan Ranelli)
(defun helm-find-files-sensitive-backspace ()
  "Deletes whole directory in helm find files mode on backspace."
  (interactive)
  (if (char-equal ?/ (char-before))
      (helm-find-files-up-one-level 1)
    (backward-delete-char 1)))

(global-set-key (kbd "C-S-s") 'helm-swoop)
(global-set-key (kbd "C-M-s") 'helm-multi-swoop-all)
(define-key isearch-mode-map (kbd "C-S-s") 'helm-swoop-from-isearch)

(provide 'setup-helm)
;;; setup-helm ends here
