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

;; Repeat searches with F3
(define-key isearch-mode-map [f3] 'isearch-repeat-forward)
(define-key isearch-mode-map [<tab>] 'isearch-repeat-forward)
(define-key isearch-mode-map [S-f3] 'isearch-repeat-backward)
(define-key isearch-mode-map [S-<tab>] 'isearch-repeat-backward)
(define-key isearch-mode-map [<up>] 'isearch-ring-advance)
(define-key isearch-mode-map [<down>] 'isearch-ring-retreat)

;; Find in files (grep)
(global-set-key (kbd "C-S-f") 'find-grep)

;; Replace
(global-set-key (kbd "C-S-r") 'query-replace-regexp)

;; Go to line
(global-set-key (kbd "C-l") 'goto-line)

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
(global-set-key (kbd "C-o")   'anything-git-goto)
(global-set-key (kbd "C-S-o") 'ido-find-file)
(global-set-key (kbd "C-M-o") 'anything-mini)

(global-set-key [C-f4] 'kill-buffer-and-window)
(global-set-key [C-S-f4] 'delete-window)

;; File reload
(global-set-key [f5] 'revert-buffer)

;; File rename
(global-set-key [f2] 'rename-file)

;; Close emacs
(global-set-key [M-f4] 'save-buffers-kill-emacs)

;; Make dir
(global-set-key (kbd "C-S-n")  'mkdir)

;; Font size
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C-<kp-add>") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-<kp-subtract>") 'text-scale-decrease)
(define-key global-map (kbd "C-0") 'text-scale-mode)
(define-key global-map (kbd "C-<kp-0>") 'text-scale-mode)

;; Mark Word
(global-set-key (kbd "C-S-<left>") 'my-mark-word-backward)
(global-set-key (kbd "C-S-<right>") 'my-mark-word)

;; Selection
(global-set-key (kbd "C-a") 'mark-whole-buffer)

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
