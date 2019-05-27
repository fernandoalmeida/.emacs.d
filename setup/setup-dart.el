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

(defun custom/run-dart-code ()
  "Run a dart code."
  (interactive)
  (shell-command (concat dart-sdk-path "/bin/dart " (buffer-file-name))))
(define-key dart-mode-map (kbd "C-c C-c") 'custom/run-dart-code)

(provide 'setup-dart)
;;; setup-dart ends here
