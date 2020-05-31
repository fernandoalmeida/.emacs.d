;;; setup-octave -- Setup octave package
;;; Commentary:
;;; Code:

(require 'ac-octave)
(add-hook 'octave-mode-hook
          '(lambda () (ac-octave-setup)))

(provide 'setup-octave)
;;; setup-octave ends here
