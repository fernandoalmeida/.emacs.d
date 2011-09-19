;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Extensions loads
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/extensions/yasnippet")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/extensions/yasnippet/snippets")

;; Haml-Mode
(add-to-list 'load-path "~/.emacs.d/extensions/haml-mode")
(require 'haml-mode)

;; Textile Mode
(add-to-list 'load-path "~/.emacs.d/extensions/textile-mode")
(require 'textile-mode)

;; Ido - Interactively do things
(add-to-list 'load-path "~/.emacs.d/extensions/ido")
(require 'ido)

;; Magit
(add-to-list 'load-path "~/.emacs.d/extensions/magit")
(require 'magit)

;; Ide-skel
(add-to-list 'load-path "~/.emacs.d/extensions/ide-skel")
(require 'ide-skel)

;; Tabbar
(add-to-list 'load-path "~/.emacs.d/extensions/tabbar")
(require 'tabbar)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flymake
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/extensions/flymake")
(require 'flymake)
(add-hook 'find-file-hook 'flymake-find-file-hook)
;; Copies in the system temp dir
(setq flymake-run-in-place nil)
(setq temporary-file-directory "/tmp/")
;; Ruby checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))

(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

(add-hook 'ruby-mode-hook
          '(lambda ()
	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
		 (flymake-mode))
	     ))
;; ERB templates checking
(defun flymake-erb-init ()
  (let* ((check-buffer (current-buffer))
         (temp-file (flymake-create-temp-inplace (buffer-file-name) "flymake"))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (save-excursion
      (save-restriction
        (widen)
        (with-temp-file temp-file 
          (let ((temp-buffer (current-buffer)))
            (set-buffer check-buffer)
            (call-process-region (point-min) (point-max) "erb" nil temp-buffer nil "-x"))))
      (setq flymake-temp-source-file-name temp-file)
      (list "ruby" (list "-c" local-file)))))

(eval-after-load "flymake"
  '(progn
     (push '(".+\\.\\(rhtml\\|erb\\)$" flymake-erb-init) flymake-allowed-file-name-masks)
     (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)))

(defun turn-on-flymake-for-erb-files ()
  (when (string-match "\.erb$" (buffer-file-name))
    (flymake-mode 1)))
(add-hook 'find-file-hook 'turn-on-flymake-for-erb-files)