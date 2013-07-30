(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

;; Auto-download archive if missing
(when (not package-archive-contents) (package-refresh-contents))

;; Auto-download missing packages
(defvar my-packages '(ruby-compilation
											color-theme
											magit
											markdown-mode
											ruby-electric
											rvm
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
											nrepl
											paredit
											ace-jump-mode
                      )
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))
