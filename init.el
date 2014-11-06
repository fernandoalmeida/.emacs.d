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
(load "~/.emacs.d/packages/init-helm.el")
