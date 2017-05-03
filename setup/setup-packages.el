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
    alchemist
    anzu ; Show number of matches in mode-line while searching
    auto-dim-other-buffers
    auto-package-update
    company
    csharp-mode
    csv-mode
    diff-hl ; Highlight uncommitted changes
    diminish
    discover
    dockerfile-mode
    dumb-jump
    editorconfig
    elixir-mode
    expand-region
    fill-column-indicator
    flycheck
    git-timemachine
    go-mode
    company-go
    gotest
    google-translate
    guide-key
    haskell-mode
    hc-zenburn-theme
    helm
    helm-ag
    helm-projectile
    helm-swoop
    highlight-indentation
    hl-anything
    ido
    iedit ; Edit multiple regions in the same way simultaneously.
    inf-ruby
    js2-mode
    less-css-mode
    lua-mode
    magit
    markdown-mode
    minitest
    multiple-cursors
    n4js ; Neo4j Shell
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
    rust-mode
    scss-mode
    smartparens
    smartscan
    sml-mode
    systemd
    terraform-mode
    textile-mode
    toml-mode
    undo-tree
    web-mode
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
