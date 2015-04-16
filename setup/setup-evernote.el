;;; setup-evernote --- Setup evernote package
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/vendor/evernote-mode")
(require 'evernote-mode)
(setq evernote-developer-token (getenv "EVERNOTE_DEVELOPER_TOKEN"))

(global-set-key (kbd "C-c e b") 'evernote-browser)
(global-set-key (kbd "C-c e n") 'evernote-create-note)
(global-set-key (kbd "C-c e s") 'evernote-browsing-search-notes)

(provide 'setup-evernote)
;;; setup-evernote ends here
