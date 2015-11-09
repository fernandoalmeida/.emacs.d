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
    anzu ; Show number of matches in mode-line while searching
    auto-package-update
    company
    csharp-mode
    diff-hl ; Highlight uncommitted changes
    diminish
    discover
    dockerfile-mode
    expand-region
    fill-column-indicator
    flycheck
    guide-key
    git-timemachine
    google-translate
    haskell-mode
    hc-zenburn-theme
    helm
    helm-projectile
    helm-swoop
    highlight-indentation
    ido
    iedit ; Edit multiple regions in the same way simultaneously.
    js2-mode
    less-css-mode
    lua-mode
    magit
    markdown-mode
    multiple-cursors
    php-mode
    powerline
    projectile
    puppet-mode
    rainbow-mode
    rbenv
    restclient
    rhtml-mode
    rspec-mode
    inf-ruby
    rubocop
    scss-mode
    smartparens
    smartscan
    textile-mode
    undo-tree
    yaml-mode
    yasnippet
    zygospore ; reversible C-x 1 (delete-other-windows)
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
