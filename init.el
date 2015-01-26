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
(load "~/.emacs.d/setup/setup-magit.el")
(load "~/.emacs.d/setup/setup-projectile.el")
(load "~/.emacs.d/setup/setup-neotree.el")
(load "~/.emacs.d/setup/setup-helm.el")
(load "~/.emacs.d/setup/setup-ruby.el")
(load "~/.emacs.d/setup/setup-multiple-cursors.el")
(load "~/.emacs.d/setup/setup-theme.el")
(load "~/.emacs.d/setup/setup-powerline.el")
(load "~/.emacs.d/setup/setup-discover.el")
(load "~/.emacs.d/setup/setup-anzu.el")
(load "~/.emacs.d/setup/setup-smartscan.el")
(load "~/.emacs.d/setup/setup-dpkg-dev.el")
(load "~/.emacs.d/setup/setup-expand-region.el")
(load "~/.emacs.d/setup/setup-diminish.el")
(load "~/.emacs.d/setup/setup-shell.el")
(load "~/.emacs.d/setup/setup-flycheck.el")
