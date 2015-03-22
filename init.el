;;; init --- Setup Emacs initialization process
;;; Commentary:
;;; Code:
(setq load-path
      (cons "~/.emacs.d/configurations"
	    (cons "~/.emacs.d/extensions" load-path)))
(load "extensions")
(load "modes")
(load "bindings")

(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/setup")

(require 'setup-packages)
(require 'setup-globals)
(require 'setup-anzu)
(require 'setup-dpkg-dev)
(require 'setup-evernote)
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
(require 'setup-theme)

(provide 'init)
;;; init.el ends here
