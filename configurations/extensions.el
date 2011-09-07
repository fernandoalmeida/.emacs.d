;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Extensions loads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/extensions/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/extensions/yasnippet/snippets")

;; Haml-Mode
(add-to-list 'load-path "~/.emacs.d/extensions/haml-mode")
(require 'haml-mode)

;; Textile Mode
(add-to-list 'load-path "~/.emacs.d/extensions/textile-mode")
(require 'textile-mode)

;; Ido - Interactively do things
(add-to-list 'load-path "~/.emacs.d/extensions/ido")
(require 'ido)

;; Magit
(add-to-list 'load-path "~/.emacs.d/extensions/magit")
(require 'magit)

;; Ide-skel
(add-to-list 'load-path "~/.emacs.d/extensions/ide-skel")
(require 'ide-skel)

;; Tabbar
(add-to-list 'load-path "~/.emacs.d/extensions/tabbar")
(require 'tabbar)
