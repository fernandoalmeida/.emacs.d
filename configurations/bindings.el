;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Custom Bindings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Undo
(global-set-key (kbd "C-z")  'undo)

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

;; File browser panel
(global-set-key [f9] 'ide-skel-toggle-left-view-window)

;; Message panel
(global-set-key [f10] 'ide-skel-toggle-bottom-view-window)

;; Buffer navigation
(global-set-key [C-next] 'tabbar-backward)
(global-set-key [C-prior]  'tabbar-forward)

;; File open/close
(global-set-key (kbd "C-o")  'find-file)
(global-set-key [C-f4] 'kill-buffer-and-window)

;; Close emacs
(global-set-key [M-f4] 'save-buffers-kill-emacs)

;; Make dir
(global-set-key (kbd "C-S-n")  'mkdir)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Git
(global-set-key (kbd "C-S-g") 'magit-status)
