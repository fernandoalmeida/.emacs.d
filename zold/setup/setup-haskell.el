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

(provide 'setup-haskell)
;;; setup-haskell ends here
