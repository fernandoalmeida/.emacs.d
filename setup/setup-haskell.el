;;; setup-haskell --- Setup Haskell mode
;;; Commentary:
;;; Code:

(require 'haskell-mode)

(setenv "PATH"
  (concat
   (getenv "HOME") "/.cabal/bin" ":"
   (getenv "PATH")
  )
)

(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'haskell-indentation-mode)

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

(defun haskell-interactive-toggle-print-mode ()
  (interactive)
  (setq haskell-interactive-mode-eval-mode
	(intern
	 (ido-completing-read "Eval result mode: "
			      '("fundamental-mode"
				"haskell-mode"
				"ghc-core-mode"
				"org-mode")))))

(eval-after-load 'haskell-mode
  '(progn
     (define-key haskell-mode-map (kbd "C-c I") 'haskell-mode-stylish-buffer)
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c c-n") 'haskell-navigate-imports)

     (custom-set-variables '(haskell-tags-on-save t))
     (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)

     ;; (define-key haskell-interactive-mode-map (kbd "C-c C-p")
     ;;   'haskell-interactive-toggle-print-mode)
   ))

(setq haskell-font-lock-symbols t)

;; Extra font locks - Thanks Renan Ranelli (github.com/rranelli) =)
(defvar rr/haskell-font-lock-extra-symbols
  '(("<alpha>" . #X03B1)
    ("<beta>" . #X03B2)
    ("<gamma>" . #X03B3)
    ("<delta>" . #X03B4)
    ("`elem`" . #X2208)
    ("elem" . #X2208)
    ("^" . #X2191)))

(eval-after-load 'haskell-font-lock
  '(progn
     (mapcar
      (lambda (entry) (add-to-list 'haskell-font-lock-symbols-alist entry))
      rr/haskell-font-lock-extra-symbols)
     (setq haskell-font-lock-keywords
	   (haskell-font-lock-keywords-create nil))))

(provide 'setup-haskell)
;;; setup-haskell ends here
