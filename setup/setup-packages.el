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
    ace-jump-mode
    anzu
    auto-package-update
    clean-aindent-mode
    company
    csharp-mode
    diff-hl
    diminish
    discover
    dockerfile-mode
    expand-region
    fill-column-indicator
    flycheck
    git-timemachine
    google-translate
    haskell-mode
    hc-zenburn-theme
    helm
    helm-projectile
    helm-swoop
    highlight-indentation
    ido
    iedit
    js2-mode
    less-css-mode
    lua-mode
    magit
    markdown-mode
    multiple-cursors
    neotree
    php-mode
    powerline
    projectile
    puppet-mode
    rainbow-mode
    rbenv
    restclient
    rhtml-mode
    rspec-mode
    rubocop
    scss-mode
    smartparens
    smartscan
    textile-mode
    undo-tree
    w3m
    yaml-mode
    yasnippet
    zygospore
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
