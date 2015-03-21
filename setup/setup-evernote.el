;;; setup-evernote --- Setup evernote package
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/extensions/evernote-mode")
(require 'evernote-mode)
(setq evernote-developer-token (getenv "EVERNOTE_DEVELOPER_TOKEN"))

(provide 'setup-evernote)
;;; setup-evernote ends here
