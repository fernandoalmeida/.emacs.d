(require 'cl)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar required-packages
  '(
    projectile
    neotree
    helm
    helm-projectile
    helm-swoop
    rbenv
    robe
    rspec-mode
    rhtml-mode
    rubocop
    iedit
    multiple-cursors
    expand-region
    zenburn-theme
    magit
    powerline
    discover
    anzu
    smartscan
    diminish
    flycheck
    smartparens
    csharp-mode
    markdown-mode
    restclient
    dockerfile-mode
    w3m
    git-timemachine
    lua-mode
    clean-aindent-mode
  ) "Required Packages list")

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
