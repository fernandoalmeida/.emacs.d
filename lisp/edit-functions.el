;;; edit-functions --- Define custom edit functions and advices
;;; Commentary:
;;; Code:

;; Custom edit functions and advices
(defadvice kill-region (before slick-cut activate compile)
  "When called with no active region, kill the line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-beginning-position 2)))))

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called with no active region, copy the line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position) (line-beginning-position 2)))))

(defun custom/newline-before ()
  "Create a new line before the current,"
  (interactive)
  (move-beginning-of-line 1)
  (newline-and-indent)
  (forward-line -1)
  (indent-for-tab-command))

(defun custom/newline-after ()
  "Always create a new line after the current."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(defun custom/kill-word (arg)
  "Kill forward word without copy."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun custom/backward-kill-word (arg)
  "Kill backward word without copy."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))

(defun custom/copy-buffer-file-path ()
  "Copy buffer file path to kill ring."
  (interactive)
  (kill-new (buffer-file-name))
  (message (concat "Copied file path: " (buffer-file-name))))
(global-set-key (kbd "C-S-w") 'custom/copy-buffer-file-path)

(defun custom/copy-buffer-file-name ()
  "Copy buffer file name to kill ring."
  (interactive)
  (kill-new (buffer-name))
  (message (concat "Copied file name: " (buffer-name))))
(global-set-key (kbd "C-S-M-w") 'custom/copy-buffer-file-name)

(provide 'edit-functions)
;;; edit-functions.el ends here
