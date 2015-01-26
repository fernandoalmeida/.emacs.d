;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Custom Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Copy - Paste
(setq mouse-drag-copy-region nil)              ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)             ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t)             ; makes killing/yanking interact with clipboard X11 selection
(setq select-active-regions t)                 ; active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary) ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; Buffer navigation
(global-set-key [C-next]  'tabbar-forward)
(global-set-key [C-prior] 'tabbar-backward)

;; File open/close
(global-set-key [C-f4] 'kill-buffer-and-window)
(global-set-key [C-S-f4] 'delete-window)

;; Switch list-buffer binding to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; WhiteSpace
(global-set-key (kbd "C-\\") 'global-whitespace-mode)
(global-set-key (kbd "C-\|") 'whitespace-cleanup)

;; Find in files (grep)
(global-set-key (kbd "C-x C-g") 'find-grep)
(global-set-key (kbd "C-c C-g") 'git-grep)
