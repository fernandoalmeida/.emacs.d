;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Custom Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-S-s") 'save-some-buffers)

;; Search
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-S-f") 'isearch-backward)
(global-set-key (kbd "C-M-f") 'find-grep)
(global-set-key (kbd "C-l") 'goto-line)

;; Replace
(global-set-key (kbd "C-M-r") 'grep-query-replace)

;; File browser
(global-set-key [f4] 'ide-skel-proj-find-files-by-regexp)
(global-set-key [f5] 'ide-skel-proj-grep-files-by-regexp)
(global-set-key [f10] 'ide-skel-toggle-left-view-window)
(global-set-key [f11] 'ide-skel-toggle-bottom-view-window)
(global-set-key [f12] 'ide-skel-toggle-right-view-window)
(global-set-key [C-next] 'tabbar-backward)
(global-set-key [C-prior]  'tabbar-forward)

;; File
(global-set-key [C-o]  'find-file)

;; Directories
(global-set-key [C-S-n]  'mkdir)

;; Undo
(global-set-key [C-z]  'undo)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Git
(global-set-key (kbd "C-S-g") 'magit-status)
