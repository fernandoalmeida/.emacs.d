;;; setup-packages --- Configure required packages
;;; Commentary:
;;; Code:
(require 'cl)
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defvar required-packages
  '(
    projectile
    auto-package-update
    neotree
    helm
    helm-projectile
    helm-swoop
    rbenv
    rspec-mode
    rhtml-mode
    rubocop
    iedit
    multiple-cursors
    expand-region
    hc-zenburn-theme
    magit
    git-timemachine
    powerline
    discover
    anzu
    smartscan
    diminish
    flycheck
    smartparens
    csharp-mode
    markdown-mode
    textile-mode
    restclient
    dockerfile-mode
    w3m
    lua-mode
    clean-aindent-mode
    zygospore
    js2-mode
    yaml-mode
    php-mode
    scss-mode
    less-css-mode
    puppet-mode
    yasnippet
    ido
    undo-tree
    company
    rainbow-mode
    highlight-indentation
    fill-column-indicator
    google-translate
    ace-jump-mode
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

(provide 'setup-packages)
;;; setup-packages ends here
