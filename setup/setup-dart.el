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

(provide 'setup-dart)
;;; setup-dart ends here
