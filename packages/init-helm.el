;; Helm setup
(setq helm-quick-update                      t ; do not display invisible candidates
      helm-split-window-in-side-p            t ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching            t
      helm-move-to-line-cycle-in-source      t
      helm-ff-search-library-in-sexp         t
      helm-scroll-amount                     4
      helm-ff-file-name-history-use-recentf  t
      helm-exit-idle-delay                   0.01 ; small value preventing fast typing issue
      helm-ff-transformer-show-only-basename nil  ; preventing hidden matching issue
      helm-ls-git-show-abs-or-relative       'relative
      helm-buffer-max-length                 50)

;; Bingings
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c C-f") 'helm-ls-git-ls)
