;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Old configs and submodules
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq load-path
  (cons "~/.emacs.d/configurations"
    (cons "~/.emacs.d/extensions" load-path)))
(load "extensions")
(load "modes")
(load "bindings")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Vendorized packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(let ((default-directory "~/.emacs.d/vendor/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; New configs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "~/.emacs.d/core/init-packages.el")
(load "~/.emacs.d/core/init-defaults.el")
(load "~/.emacs.d/packages/init-magit.el")
(load "~/.emacs.d/packages/init-projectile.el")
(load "~/.emacs.d/packages/init-neotree.el")
(load "~/.emacs.d/packages/init-helm.el")
(load "~/.emacs.d/packages/init-ruby.el")
(load "~/.emacs.d/packages/init-multiple-cursors.el")
(load "~/.emacs.d/packages/init-theme.el")
(load "~/.emacs.d/packages/init-powerline.el")
(load "~/.emacs.d/packages/init-discover.el")
(load "~/.emacs.d/packages/init-anzu.el")
(load "~/.emacs.d/packages/init-smartscan.el")
(load "~/.emacs.d/packages/init-dpkg-dev.el")
(load "~/.emacs.d/packages/init-expand-region.el")
(load "~/.emacs.d/packages/init-diminish.el")
