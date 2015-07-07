;;; setup-org --- Setup org mode
;;; Commentary:
;;; Code:
(require 'org)

(setq org-directory "~/Dropbox/fernando/org/")
(setq org-files-regexp "\\.\\(org\\|org_archive\\|txt\\)$")
(setq org-user-agenda-files (directory-files org-directory t org-files-regexp))
(setq org-default-notes-file (concat org-directory "refile.org"))

(add-to-list 'auto-mode-alist (cons org-files-regexp 'org-mode))

(global-unset-key (kbd "C-o"))
(global-set-key (kbd "C-o c") 'org-capture)
(global-set-key (kbd "C-o a") 'org-agenda)
(global-set-key (kbd "C-o l") 'org-store-link)
(global-set-key (kbd "C-o b") 'org-iswitchb)


(setq org-todo-keywords
      (quote ((sequence "TODO(t)"
                        "NEXT(n)"
                        "|"
                        "DONE(d)")
              (sequence "WAITING(w@/!)"
                        "HOLD(h@/!)"
                        "|"
                        "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      '(("TODO" :foreground "red" :weight bold)
        ("NEXT" :foreground "blue" :weight bold)
        ("DONE" :foreground "forest green" :weight bold)
        ("WAITING" :foreground "orange" :weight bold)
        ("HOLD" :foreground "magenta" :weight bold)
        ("CANCELLED" :foreground "forest green" :weight bold)))

(setq org-use-fast-todo-selection t)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-capture-templates
      '(("t" "todo" entry (file org-default-notes-file)
	 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
	("n" "note" entry (file org-default-notes-file)
	 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
	("h" "Habit" entry (file org-default-notes-file)
	 "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

(provide 'setup-org)
;;; setup-org ends here
