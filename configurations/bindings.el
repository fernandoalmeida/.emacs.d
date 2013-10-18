;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Custom Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Undo / Redo
(global-set-key (kbd "C-z")  'undo-tree-undo)
(global-set-key (kbd "C-S-z")  'undo-tree-redo)

;; Save
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'save-some-buffers)

;; Copy - Paste
;; (transient-mark-mode 1)    ; Now on by default: makes the region act quite like the text "highlight" in many apps.
;; (setq shift-select-mode t) ; Now on by default: allows shifted cursor-keys to control the region.
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil) ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t) ; makes killing/yanking interact with clipboard X11 selection

;; these will probably be already set to these values, leave them that way if so!
;; (setf interprogram-cut-function 'x-select-text)
;; (setf interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; You need an emacs with bug #902 fixed for this to work properly. It has now been fixed in CVS HEAD.
;; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
;; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
;; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted
;; text with the mouse if you want to)
(setq select-active-regions t) ; active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary) ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; with this, doing an M-y will also affect the X11 clipboard, making emacs act as a sort of clipboard history, at
;; least of text you've pasted into it in the first place.
;; (setq yank-pop-change-selection t)  ; makes rotating the kill ring change the X11 clipboard.
(global-set-key (kbd "C-c") 'kill-ring-save)
(global-set-key (kbd "C-x") 'kill-region)
(global-set-key (kbd "C-v") 'cua-paste)
(global-set-key (kbd "C-S-v") 'cua-paste-pop)

;; Use regex searches by default
(global-set-key (kbd "C-f") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

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

;; Maximize Current Window
(global-set-key [f11] 'delete-other-windows)

;; Buffer navigation
(global-set-key [C-tab]  'tabbar-forward)
(global-set-key [C-S-iso-lefttab] 'tabbar-backward)

;; File open/close
(global-set-key (kbd "C-o")   'anything-git-goto)
(global-set-key (kbd "C-S-o") 'ido-find-file)
(global-set-key [C-f4] 'kill-buffer-and-window)

;; File reload
(global-set-key [f5] 'revert-buffer)

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

;; Paste pop
(global-set-key (kbd "C-S-v") 'cua-paste-pop)

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
(global-set-key (kbd "C-\\") 'whitespace-mode)
(global-set-key (kbd "C-\|") 'global-whitespace-mode)

;; Git
(global-set-key (kbd "C-g") 'git-status)