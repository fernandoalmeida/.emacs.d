;;; setup-org --- Setup org mode
;;; Commentary:
;;; Code:
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

(setq org-capture-templates
      '(("t" "Task" entry (file+headline "~/.emacs.d/org/tasks.org" "Tasks")
	 "* TODO %?\n %i\n %a")
	("n" "Note" entry (file+datetree "~/.emacs.d/org/notes.org" "Notes")
	 "* %?\nEntered on %U\n %i\n %a")))

(provide 'setup-org)
;;; setup-org ends here
