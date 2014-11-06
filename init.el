(load "~/.emacs.d/core/init-packages.el")
(setq load-path
  (cons "~/.emacs.d/configurations"
    (cons "~/.emacs.d/extensions" load-path)))
(load "extensions")
(load "macros")
(load "emacs-std")
(load "modes")
(load "bindings")