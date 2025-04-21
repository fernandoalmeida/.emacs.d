;;; xml-functions --- Define functions for xml handling
;;; Commentary:
;;; Code:

(defun xmllint-format-buffer ()
  "Format the current buffer using xmllint, replacing its content."
  (interactive)
  (let ((current-point (point)))
    (shell-command-on-region (point-min) (point-max)
                             "xmllint --pretty 2 -"
                             (current-buffer) t "*Xmllint Errors*" t)
    (goto-char current-point)))

(provide 'xml-functions)
;;; asdf-functions.el ends here
