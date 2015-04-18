;;; setup-navigation --- Setup buffers and frames configurations
;;; Commentary:
;;; Code:

;; Buffer Navigation
(global-set-key [M-left] 'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-down] 'windmove-down)
(global-set-key [M-up] 'windmove-up)

;; Frame Navigation
(global-set-key (kbd "C-c o") 'other-frame)
(global-set-key [M-S-left] 'other-frame)
(global-set-key [M-S-right] 'other-frame)

;; Disable paging
(setenv "PAGER" "cat")

;; Reuse buffers between frames
(setq-default display-buffer-reuse-frames t)

;; Reversible C-x 1
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(setq ace-jump-mode-move-keys  (append "asdfghjklqweiop" nil))
(define-key global-map (kbd "C-;") 'ace-jump-mode)
(setq ace-jump-word-mode-use-query-char nil)

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(provide 'setup-navigation)
;;; setup-navigation.el ends here
