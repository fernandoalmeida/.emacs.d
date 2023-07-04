;;; init --- Setup Emacs initialization process
;;; Commentary:
;;; Code:

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/setup")

;; order dependent
(require 'setup-packages)

;; no order dependent
(require 'use-package)
(require 'setup-dart)
(require 'edit-functions)
(require 'bundle-functions)
(require 'android-functions)
(require 'setup-globals)
(require 'setup-company)
(require 'setup-dired)
(require 'setup-anzu)
(require 'setup-dpkg-dev)
(require 'setup-multiple-cursors)
(require 'setup-org)
(require 'setup-ruby)
(require 'setup-haskell)
(require 'setup-smartscan)
(require 'setup-projectile)
(require 'setup-helm)
(require 'setup-text-scale)
(require 'setup-whitespace)
(require 'setup-ui)
(require 'setup-navigation)
(require 'setup-git)
(require 'setup-smartparens)
(require 'setup-guide-key)
;; (require 'setup-go)
(require 'setup-elixir)
;; (require 'setup-wakatime)
(require 'setup-javascript)
(require 'setup-safe-local-variables)
(require 'setup-ein)
(require 'setup-octave)
(require 'setup-python)
(require 'setup-diminish)

(provide 'init)
;;; init.el ends here
