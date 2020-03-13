;;; setup-anzu --- Setup safe local variables
;;; Commentary:
;;; Code:

(put 'alchemist-mix-command 'safe-local-variable #'stringp)

;; (add-to-list 'safe-local-variable-values
;;              '(alchemist-mix-command . "docker-compose run atena /usr/local/bin/mix"))

(provide 'setup-safe-local-variables)
;;; setup-safe-local-variables ends here
