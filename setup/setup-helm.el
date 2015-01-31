(helm-mode t)

(setq helm-quick-update                      t ; do not display invisible candidates
      helm-buffers-fuzzy-matching            t
      helm-move-to-line-cycle-in-source      t
      helm-ff-search-library-in-sexp         t
      helm-scroll-amount                     4
      helm-ff-file-name-history-use-recentf  t
      helm-exit-idle-delay                   0.01 ; small value preventing fast typing issue
      helm-ff-transformer-show-only-basename nil  ; preventing hidden matching issue
      helm-ls-git-show-abs-or-relative       'relative
      helm-full-frame                        t
      helm-buffer-max-length                 50
      helm-bookmark-show-location            t
      helm-projectile-sources-list           '(helm-source-projectile-buffers-list
					       helm-source-projectile-files-list))

(autoload 'helm-descbinds      "helm-descbinds" t)
(autoload 'helm-eshell-history "helm-eshell"    t)
(autoload 'helm-esh-pcomplete  "helm-eshell"    t)

(add-hook 'eshell-mode-hook
          '(lambda ()
	     (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history)))

(global-unset-key (kbd "C-x c"))
(global-set-key   (kbd "M-x")     'helm-M-x)
(global-set-key   (kbd "M-y")     'helm-show-kill-ring)

(global-set-key   (kbd "C-x p")   'helm-projectile-switch-project)
(global-set-key   (kbd "C-x b")   'helm-buffers-list)
(global-set-key   (kbd "C-x f")   'helm-projectile)
(global-set-key   (kbd "C-x C-f") 'helm-find-files)
(global-set-key   (kbd "C-x r l") 'helm-filtered-bookmarks)

(global-set-key   (kbd "C-c h")   'helm-command-prefix)
(global-set-key   (kbd "C-c r")   'helm-recentf)

(global-set-key   (kbd "C-h a")   'helm-apropos)
(global-set-key   (kbd "C-h i")   'helm-info-emacs)
(global-set-key   (kbd "C-h b")   'helm-descbinds)

;; More familiar helm find-file navigation (from Renan Ranelli - github.com/rranelli)
(defun helm-find-files-sensitive-backspace ()
  "Deletes whole directory in helm find files mode on backspace."
  (interactive)
  (if (char-equal ?/ (char-before))
      (helm-find-files-up-one-level 1)
    (backward-delete-char 1)))

(define-key helm-find-files-map (kbd "<backspace>") 'helm-find-files-sensitive-backspace)
(define-key helm-find-files-map (kbd "<tab>")       'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "<C-tab>")     'helm-select-action)

