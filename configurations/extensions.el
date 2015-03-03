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

;; Scss-Mode
(add-to-list 'load-path "~/.emacs.d/extensions/scss-mode")
(require 'scss-mode)
(setq scss-compile-at-save nil)

;; Less-CSS-Mode
(add-to-list 'load-path "~/.emacs.d/extensions/less-css-mode")
(require 'less-css-mode)

;; Zen Coding Mode
(add-to-list 'load-path "~/.emacs.d/extensions/zencoding-mode")
(require 'zencoding-mode)

;; Yaml-Mode
(add-to-list 'load-path "~/.emacs.d/extensions/yaml-mode")
(require 'yaml-mode)

;; PHP Mode
(add-to-list 'load-path "~/.emacs.d/extensions/php-mode")
(require 'php-mode)

;; Javascript JS2 Mode
(add-to-list 'load-path "~/.emacs.d/extensions/js2-mode")
(require 'js2-mode)

;; Textile Mode
(add-to-list 'load-path "~/.emacs.d/extensions/textile-mode")
(require 'textile-mode)

;; Ido - Interactively do things
(add-to-list 'load-path "~/.emacs.d/extensions/ido")
(require 'ido)

;; UndoTree
(add-to-list 'load-path "~/.emacs.d/extensions/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

;; Git Emacs
(add-to-list 'load-path "~/.emacs.d/extensions/git-emacs")
(require 'git-emacs)

;; Auto Complete
(add-to-list 'load-path "~/.emacs.d/extensions/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/extensions/auto-complete/ac-dict")
(ac-config-default)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)

;; Tabbar
(add-to-list 'load-path "~/.emacs.d/extensions/tabbar")
(require 'tabbar)

;; Buffer Background
(add-to-list 'load-path "~/.emacs.d/extensions/buffer-bg")
(require 'buffer-bg)

;; Rainbow Mode
(add-to-list 'load-path "~/.emacs.d/extensions/rainbow-mode")
(require 'rainbow-mode)
(add-hook 'css-mode-hook      'rainbow-turn-on)
(add-hook 'scss-mode-hook     'rainbow-turn-on)
(add-hook 'less-css-mode-hook 'rainbow-turn-on)

;; Highlight Indentation
(add-to-list 'load-path "~/.emacs.d/extensions/highlight-indentation")
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3e3")
(set-face-background 'highlight-indentation-current-column-face "#393939")

;; Puppet Mode
(add-to-list 'load-path "~/.emacs.d/extensions/puppet-mode")
(require 'puppet-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; buffer-bg
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar chosig-alist
  '((shell-mode . "#000")
    (eshell-mode . "#000"))
  "Alist matching major modes or buffer names with background colors.
Every cons cell on the alist has the form (CHECK . COLOR) where CHECK
is either a symbol matching the `major-mode' or a regular expression
matching the `buffer-name' of the current buffer. COLOR is a string
representing a valid color, eg. \"red\" or \"f00\".")

(defun chosig-choose-background ()
  "Pick background-color according to `chosig-alist'.
The overlay used is stored in `chosig-background'."
  (let ((alist chosig-alist)
	background)
    (while (and (not background) alist)
      (if (or (and (stringp (caar alist))
		   (string-match (caar alist) (buffer-name)))
	      (eq major-mode (caar alist)))
	  (setq background (cdar alist))
	(setq alist (cdr alist))))
    ;; cleanup
    (mapc (lambda (o)
	    (when (overlay-get o 'chosig)
	      (delete-overlay o)))
	  (overlays-in (point-min) (point-max)))
    ;; new one
    (when background
      (let ((o (make-overlay (point-min) (point-max)
			     (current-buffer) nil t)))
	(overlay-put o 'face `(:background ,background))
	(overlay-put o 'chosig t)))))

(add-hook'after-change-major-mode-hook 'chosig-choose-background)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; JS2 Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load "js2-mode"
  '(progn
     (setq js2-missing-semi-one-line-override t)
     (setq-default js2-basic-offset 2) ; 2 spaces for indentation (if you prefer 2 spaces instead of default 4 spaces for tab)

     ;; following is from http://www.emacswiki.org/emacs/Js2Mode
     (add-hook 'js2-post-parse-callbacks 'my-js2-parse-global-vars-decls)
     (defun my-js2-parse-global-vars-decls ()
       (let ((btext (replace-regexp-in-string
                     ": *true" " "
                     (replace-regexp-in-string "[\n\t ]+" " " (buffer-substring-no-properties 1 (buffer-size)) t t))))
         (setq js2-additional-externs
               (split-string
                (if (string-match "/\\* *global *\\(.*?\\) *\\*/" btext) (match-string-no-properties 1 btext) "")
                " *, *" t))
         ))
     ))
