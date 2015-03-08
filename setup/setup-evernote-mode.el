(add-to-list 'load-path "~/.emacs.d/extensions/evernote-mode")
(require 'evernote-mode)
(setq evernote-developer-token (getenv "EVERNOTE_DEVELOPER_TOKEN"))
