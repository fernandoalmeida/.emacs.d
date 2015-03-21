;;; setup-multiple-cursors --- Setup multiple cursors package
;;; Commentary:
;;; Code:
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

(provide 'setup-multiple-cursors)
;;; setup-multiple-cursors ends here
