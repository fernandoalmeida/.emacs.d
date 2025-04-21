;;; setup-guide-key --- Setup guide-key package
;;; Commentary:
;;; Code:
(require 'guide-key)

(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-o"))
(guide-key-mode t)
(setq guide-key/idle-delay 1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)

(provide 'setup-guide-key)
;;; setup-guide-key ends here
