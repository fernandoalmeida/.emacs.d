(require 'cl)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar required-packages
  '(
    helm
    helm-ls-git
    zenburn-theme
  ) "required packages list")

; check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; install packages on startup
(unless (packages-installed-p)
  (package-refresh-contents)
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))