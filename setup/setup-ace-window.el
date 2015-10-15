;;; setup-ace-window --- Setup ace-window package
;;; Commentary:
;;; Code:
(require 'ace-window)

(global-set-key (kbd "C-S-o") 'ace-window)
(setq aw-keys '(?o ?i ?j ?k ?l ?h))
(setq aw-background nil)

(provide 'setup-ace-window)
;;; setup-ace-window.el ends here
