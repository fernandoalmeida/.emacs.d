;;; asdf-functions --- Define functions for asdf usage
;;; Commentary:
;;; Code:

(defcustom asdf-path "$HOME/.asdf"
  "Path to asdf directory."
  :type 'string
  :group 'asdf)

(defcustom asdf-binary "$HOME/.asdf/bin/asdf"
  "Path to asdf binary."
  :type 'string
  :group 'asdf)

(defun custom/asdf-enable ()
  "Setup asdf for environment."
  (interactive)
  (let ((shims-path (substitute-env-vars (concat asdf-path "/shims")))
        (bin-path (directory-file-name (file-name-directory (substitute-env-vars asdf-binary)))))
    (setenv "PATH" (concat shims-path ":" bin-path ":" (getenv "PATH")))
    (setq exec-path (nconc (list shims-path bin-path) exec-path))))

(provide 'asdf-functions)
;;; asdf-functions.el ends here
