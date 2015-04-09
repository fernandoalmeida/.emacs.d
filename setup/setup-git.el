;;; setup-git --- Setup Git modes
;;; Commentary:
;;; Code:

;; Git Emacs
(add-to-list 'load-path "~/.emacs.d/vendor/git-emacs")
(require 'git-emacs)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'setup-git)
;;; setup-git ends here
