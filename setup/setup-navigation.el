;;; setup-navigation --- Setup buffers and frames configurations
;;; Commentary:
;;; Code:

;; Custom edit bindings
(global-set-key (kbd "C-j") 'newline-and-indent)
(global-set-key (kbd "C-S-j") 'custom/newline-before)
(global-set-key (kbd "C-M-j") 'custom/newline-after)
(global-set-key (kbd "M-d") 'custom/kill-word)
(global-set-key (kbd "C-<backspace>") 'custom/backward-kill-word)
(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "C-c C-j") (lambda ()
				  (interactive)
				  (save-excursion
				    (forward-line)
				    (join-line))))
(global-set-key (kbd "C-c i") (lambda ()
				(interactive)
				(indent-region (point-min) (point-max))))

;; Content Navigation
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))
(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
;; (define-key markdown-mode-map (kbd "M-p") (lambda () (interactive) (previous-line 5)))
;; (define-key markdown-mode-map (kbd "M-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "C-S-n") 'end-of-buffer)
(global-set-key (kbd "C-S-p") 'beginning-of-buffer)
(global-set-key (kbd "<f2>") 'rename-buffer)
(global-set-key (kbd "<f5>") 'revert-buffer)

;; Window Navigation
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-down] 'windmove-down)
(global-set-key [M-up] 'windmove-up)

;; Resize Windows
(global-set-key (kbd "C-]") (lambda () (interactive) (shrink-window-horizontally -1)))
(global-set-key (kbd "C-}") 'shrink-window-horizontally)
(global-set-key (kbd "M-]") (lambda () (interactive) (shrink-window -1)))
(global-set-key (kbd "M-}") 'shrink-window)

;; Frame Navigation
(global-set-key (kbd "C-c o") 'other-window)
(global-set-key (kbd "C-c C-o") 'other-frame)
(global-set-key (kbd "C-x C-o") 'next-multiframe-window)
(global-set-key [M-S-left] 'other-frame)
(global-set-key [M-S-right] 'other-frame)

;; Jump to definitions
(require 'dumb-jump)
(global-set-key (kbd "M-.") 'dumb-jump-go)
(global-set-key (kbd "C-M-.") 'dumb-jump-go-other-window)
(global-set-key (kbd "M-,") 'dumb-jump-back)
(setq dumb-jump-selector 'helm)

;; Reuse buffers between frames
(setq-default display-buffer-reuse-frames t)

;; Reversible C-x 1
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

(provide 'setup-navigation)
;;; setup-navigation.el ends here
