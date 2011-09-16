;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Custom Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Undo / Redo
(global-set-key (kbd "C-z")  'undo-tree-undo)
(global-set-key (kbd "C-S-z")  'undo-tree-redo)

;; Save
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'save-some-buffers)

;; Use regex searches by default
(global-set-key (kbd "C-f") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Repeat searches with F3
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key isearch-mode-map [S-f3] 'isearch-repeat-backward)

(global-set-key (kbd "C-M-f") 'find-grep)
(global-set-key (kbd "C-l") 'goto-line)

;; Replace
(global-set-key (kbd "C-M-r") 'grep-query-replace)

;; File browser panel
(global-set-key [f9] 'ide-skel-toggle-left-view-window)

;; Message panel
(global-set-key [f8] 'ide-skel-toggle-bottom-view-window)

;; Maximize Current Window
(global-set-key [f11] 'delete-other-windows)

;; Buffer navigation
(global-set-key [C-next] 'tabbar-backward)
(global-set-key [C-prior]  'tabbar-forward)
(global-set-key [C-tab]  'tabbar-forward)

;; File open/close
(global-set-key (kbd "C-o")  'ido-find-file)
(global-set-key [C-f4] 'kill-buffer-and-window)

;; Close emacs
(global-set-key [M-f4] 'save-buffers-kill-emacs)

;; Make dir
(global-set-key (kbd "C-S-n")  'mkdir)

;; Font size
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C-<kp-add>") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-<kp-subtract>") 'text-scale-decrease)
(define-key global-map (kbd "C-0") 'text-scale-adjust)
(define-key global-map (kbd "C-<kp-0>") 'text-scale-adjust)

;; Git
(global-set-key (kbd "C-S-g") 'magit-status)

;; Paste pop
(global-set-key (kbd "C-S-v") 'cua-paste-pop)

;; Scolling
(global-set-key (kbd "C-<left>") 'scroll-right)
(global-set-key (kbd "C-<right>") 'scroll-left)
(global-set-key (kbd "C-<up>") 'scroll-down)
(global-set-key (kbd "C-<down>") 'scroll-up)

;; Selection
(global-set-key (kbd "C-a") 'mark-whole-buffer)
