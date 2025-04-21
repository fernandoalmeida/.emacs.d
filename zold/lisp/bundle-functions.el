;;; bundle-functions --- Define functions for bundler usage
;;; Commentary:
;;; Code:

(defun custom/bundle-open (gem-name)
  "Open gem directory with Dired"
  (interactive "sBundle open (gem name): ")
  (progn
    (dired (shell-command-to-string (concat "bundle show " gem-name)))
    (dired-find-alternate-file)))

(provide 'bundle-functions)
;;; bundle-functions.el ends here
