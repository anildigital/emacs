(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))

(add-to-list 'package-archives
						 '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Auto-download archive if missing
(when (not package-archive-contents) (package-refresh-contents))

;; Auto-download missing packages
(defvar my-packages '(ruby-compilation
                      magit
                      multiple-cursors
                      markdown-mode
                      ruby-electric
                      scpaste
                      smex
                      textmate
                      lua-mode
                      gist
                      idle-highlight-mode
                      yaml-mode
                      coffee-mode
                      clojure-mode
                      clojure-test-mode
                      cider
                      paredit
                      ace-jump-mode
                      projectile
                      emmet-mode
                      spacegray-theme
                      )
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))
