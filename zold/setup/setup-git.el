;;; setup-git --- Setup Git modes
;;; Commentary:
;;; Code:

;; Git Emacs
(add-to-list 'load-path "~/.emacs.d/vendor/git-emacs")
(require 'git-emacs)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Diff Highlight
(global-diff-hl-mode)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(setq smerge-command-prefix (kbd "C-c v"))

(provide 'setup-git)
;;; setup-git ends here
