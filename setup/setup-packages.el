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
    company-lsp
    csharp-mode
    csv-mode
    dart-mode
    diff-hl ; Highlight uncommitted changes
    diminish
    discover
    dockerfile-mode
    ein ; Emacs iPython Notebook
    elixir-mode
    emmet-mode
    ess ; Emacs Speaks Statistics (required by org-babel/R)
    expand-region
    fill-column-indicator
    flow-js2-mode
    flutter
    flycheck
    flycheck-credo
    flycheck-flow
    flycheck-kotlin
    git-timemachine
    go-mode
    company-go
    gotest
    google-translate
    groovy-mode
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
    jupyter
    kotlin-mode
    less-css-mode
    lsp-mode
    lsp-ui
    lua-mode
    magit
    markdown-mode
    minitest
    multiple-cursors
    ob-elixir
    ob-rust
    org-bullets
    php-mode
    powerline
    projectile
    puppet-mode
    rainbow-delimiters
    rainbow-mode
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
    typescript-mode
    undo-tree
    wakatime-mode
    yaml-mode
    yasnippet
    yasnippet-snippets
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
