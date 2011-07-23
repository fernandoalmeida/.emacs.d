(setq load-path
  (cons "~/.emacs.d/configurations"
    (cons "~/.emacs.d/extensions" load-path)))
(load "extensions")
(load "macros")
(load "emacs-std")
(load "modes")
(load "bindings")
(custom-set-variables
 '(initial-major-mode (quote lisp-interaction-mode))
 '(initial-scratch-message ""))
(custom-set-faces
 '(tabbar-button-highlight ((t (:inherit tabbar-button))))
 '(tabbar-default ((t (:inherit variable-pitch :background "gray82" :foreground "gray50" :height 0.8))))
 '(tabbar-highlight ((t nil)))
 '(tabbar-selected ((t (:inherit tabbar-default :background "white" :foreground "blue" :box (:line-width 1 :color "black")))))
 '(tabbar-separator ((t (:inherit tabbar-default :height 0.2))))
 '(tabbar-unselected ((t (:inherit tabbar-default :background "gray72" :foreground "black" :box (:line-width 1 :color "black"))))))
