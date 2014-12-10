;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Old configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq load-path
  (cons "~/.emacs.d/configurations"
    (cons "~/.emacs.d/extensions" load-path)))
(load "extensions")
(load "macros")
(load "emacs-std")
(load "modes")
(load "bindings")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; New configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/core/init-packages.el")
(load "~/.emacs.d/packages/init-magit.el")
(load "~/.emacs.d/packages/init-projectile.el")
(load "~/.emacs.d/packages/init-neotree.el")
(load "~/.emacs.d/packages/init-helm.el")
(load "~/.emacs.d/packages/init-ruby.el")
(load "~/.emacs.d/packages/init-multiple-cursors.el")
(load "~/.emacs.d/packages/init-theme.el")
(load "~/.emacs.d/packages/init-powerline.el")
