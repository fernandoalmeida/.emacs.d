;;; setup-dart -- Setup dart package
;;; Commentary:
;;; Code:
(require 'dart-mode)

(setq dart-sdk-path "/opt/flutter/bin/cache/dart-sdk/")
(setq dart-enable-analysis-server t)
(setq dart-format-on-save nil)

(define-key dart-mode-map (kbd "M-.") 'dart-goto)
(define-key dart-mode-map (kbd "C-M-.") 'dart-find-refs)
(define-key dart-mode-map (kbd "C-c i") 'dart-format)

(defun custom/dart-run-code ()
  "Run a dart code."
  (interactive)
  (shell-command (concat dart-sdk-path "/bin/dart " (buffer-file-name))))
(define-key dart-mode-map (kbd "C-c C-c") 'custom/dart-run-code)

(defun custom/dart-wrap-with ()
  "Wrap with a widget"
  (interactive)
  (let* ((widget (read-string "Wrap with: "))
         (start (region-beginning))
         (end (region-end))
        (selection (delete-and-extract-region start end))
        (wrapped (concat widget "(\n child: " selection "\n)")))
    (insert wrapped)
    (dart-format)))
(define-key dart-mode-map (kbd "C-c .") 'custom/dart-wrap-with)

;; WIP
(defun custom/dart-import-package ()
  "Auto import the package."
  (interactive)
  (let ((identifier (thing-at-point 'word)))
    (message (concat "identifier " identifier))
    (dart--analysis-server-send
     "search.findTopLevelDeclarations"
     (list (cons "pattern" identifier))
     (lambda (response)
       (if response
           (let ((id (dart--get response 'result 'id)))
             (message "%s" id))
         (message "no no no"))))))
(define-key dart-mode-map (kbd "C-c C-.") 'custom/dart-import-package)

(provide 'setup-dart)
;;; setup-dart ends here
