;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Custom Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Copy - Paste
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil) ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t) ; makes killing/yanking interact with clipboard X11 selection

;; You need an emacs with bug #902 fixed for this to work properly. It has now been fixed in CVS HEAD.
;; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
;; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
;; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted
;; text with the mouse if you want to)
(setq select-active-regions t) ; active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary) ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; File browser panel
(global-set-key [f9] 'ide-skel-toggle-left-view-window)

;; Message panel
(global-set-key [f8] 'ide-skel-toggle-bottom-view-window)

;; Window Navigation
(global-set-key [C-tab] 'other-window)
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-down] 'windmove-down)
(global-set-key [M-up] 'windmove-up)

;; Buffer navigation
(global-set-key [C-next]  'tabbar-forward)
(global-set-key [C-prior] 'tabbar-backward)

;; File open/close
(global-set-key [C-f4] 'kill-buffer-and-window)
(global-set-key [C-S-f4] 'delete-window)

;; File reload
(global-set-key [f5] 'revert-buffer)

;; File rename
(global-set-key [f2] 'rename-file)

;; Switch list-buffer binding to bs-show
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Close emacs
(global-set-key [M-f4] 'save-buffers-kill-emacs)

;; Mark Word
(global-set-key (kbd "C-S-<left>") 'my-mark-word-backward)
(global-set-key (kbd "C-S-<right>") 'my-mark-word)

;; Comments
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-M-/") 'comment-box)

;; Hide/Show
(global-set-key (kbd "C-.") 'hs-toggle-hiding)
(global-set-key (kbd "C->") 'hs-show-all)
(global-set-key (kbd "C-<") 'hs-hide-all)
(global-set-key (kbd "C-,") 'hs-hide-all-comments)

;; WhiteSpace
(global-set-key (kbd "C-\\") 'global-whitespace-mode)
(global-set-key (kbd "C-\|") 'whitespace-cleanup)

;; Git
(global-set-key (kbd "C-x g") 'magit-status)

;; Find in files (grep)
(global-set-key (kbd "C-x C-g") 'find-grep)
(global-set-key (kbd "C-c C-g") 'git-grep)
