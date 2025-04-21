;;; setup-go -- Setup go package
;;; Commentary:
;;; Code:

(setenv "GOPATH" (concat (getenv "HOME") "/trabalho/projetos/go"))
(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path (concat (getenv "HOME") "/trabalho/projetos/go/bin"))
(load "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))))

(define-key go-mode-map (kbd "C-c , v") 'go-test-current-file)
(define-key go-mode-map (kbd "C-c , s") 'go-test-current-test)
(define-key go-mode-map (kbd "C-c , a") 'go-test-current-project)
(define-key go-mode-map (kbd "C-c C-s") 'go-run)

(provide 'setup-go)
;;; setup-go ends here
