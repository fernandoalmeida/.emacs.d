;;; android-functions --- Define android helper functions
;;; Commentary:
;;; Code:

(defun custom/run-android-emulator ()
  "Run Android emulator."
  (interactive)
  (let* ((command (concat (getenv "HOME") "/.android-sdk/emulator/emulator"))
        (avd (shell-command-to-string (concat command " -list-avds | head -1"))))
    (async-shell-command (concat command " -avd " avd))
    ))

(provide 'android-functions)
;;; android-functions.el ends here
