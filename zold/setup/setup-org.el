;;; setup-org --- Setup org mode
;;; Commentary:
;;; Code:
(require 'org)
(require 'org-bullets)
(require 'zetteldeft)

(setq org-directory "~/Dropbox/fernando/notes/org")
(setq org-agenda-files (directory-files-recursively org-directory "\.org$"))
(setq org-files-regexp "\\.\\(org\\|org_archive\\|txt\\)$")
(setq org-user-agenda-files (directory-files org-directory t org-files-regexp))
(setq org-default-notes-file (concat org-directory "refile.org"))

(add-to-list 'auto-mode-alist (cons org-files-regexp 'org-mode))

(global-set-key (kbd "C-c o o") 'org-capture)
(global-set-key (kbd "C-c o a") 'org-agenda)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)"
                        "NEXT(n)"
                        "DOING(i)"
                        "WAITING(w)"
                        "|"
                        "DONE(d)"
                        "CANCELLED(c)"))))

(setq org-todo-keyword-faces
      '(("TODO" :foreground "gold" :weight bold)
        ("NEXT" :foreground "orange" :weight bold)
        ("DOING" :foreground "deep sky blue" :weight bold)
        ("DONE" :foreground "lime green" :weight bold)
        ("WAITING" :foreground "aquamarine" :weight bold)
        ("CANCELLED" :foreground "orange red" :weight bold)))

(setq org-use-fast-todo-selection t)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              (done ("WAITING"))
              ("TODO" ("WAITING") ("CANCELLED"))
              ("NEXT" ("WAITING") ("CANCELLED"))
              ("DONE" ("WAITING") ("CANCELLED")))))

(setq org-capture-templates
      '(("t" "todo" entry (file org-default-notes-file)
	 "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
	("n" "note" entry (file org-default-notes-file)
	 "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
	("h" "Habit" entry (file org-default-notes-file)
	 "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

(setq org-priority-faces
      '((65 :foreground "red")
        (66 :foreground "gold")
        (67 :foreground "aquamarine")))

(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook 'org-bullets-mode)
(define-key org-mode-map (kbd "C-j") 'org-return)
(define-key org-mode-map (kbd "C-m") 'org-return-indent)
(define-key org-mode-map (kbd "C-c e") 'org-toggle-link-display)

;; Org Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((elixir . t)
   (emacs-lisp . t)
   (python . t)
   (R . t)
   (ruby . t)
   (rust . t)
   (shell . t)
   (jupyter . t)))

(setq org-confirm-babel-evaluate nil)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;; Zetteldeft Zettelkasten method
(setq deft-extensions '("md" "org" "txt"))
(setq deft-directory "~/Dropbox/fernando/notes/zetteldeft")
(setq deft-use-filename-as-title t)
(setq deft-default-extension "org")
(setq zetteldeft-id-filename-separator "-")
(setq deft-auto-save-interval 0)
(zetteldeft-set-classic-keybindings)

(provide 'setup-org)
;;; setup-org ends here
