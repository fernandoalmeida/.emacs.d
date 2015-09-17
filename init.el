;;; init --- Setup Emacs initialization process
;;; Commentary:
;;; Code:
(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/setup")

(require 'setup-packages)
(require 'edit-functions)
(require 'bundle-functions)
(require 'setup-globals)
(require 'setup-company)
(require 'setup-dired)
(require 'setup-anzu)
(require 'setup-dpkg-dev)
(require 'setup-multiple-cursors)
(require 'setup-org)
(require 'setup-ruby)
(require 'setup-smartscan)
(require 'setup-projectile)
(require 'setup-helm)
(require 'setup-neotree)
(require 'setup-text-scale)
(require 'setup-whitespace)
(require 'setup-diminish)
(require 'setup-ui)
(require 'setup-navigation)
(require 'setup-git)
(require 'setup-smartparens)
(require 'setup-guide-key)

(provide 'init)
;;; init.el ends here
