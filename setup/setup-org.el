(setq org-directory "~/.emacs.d/org")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map (kbd "C-c c") 'org-capture)

(setq org-todo-keywords
      '((sequence "TODO"
                  "DOING"
		  "REVIEW"
                  "|"
                  "DONE"
                  "DELEGATED")))
