;;; setup-acejump --- Setup acejump package
;;; Commentary:
;;; Code:
(require 'ace-jump-mode)

(setq ace-jump-mode-move-keys  (append "asdfghjklqweiop" nil))
(define-key global-map (kbd "C-;") 'ace-jump-mode)
(setq ace-jump-word-mode-use-query-char nil)

(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(provide 'setup-acejump)
;;; setup-acejump.el ends here
