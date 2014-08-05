;;; package --- Summary
;;; package.el
;;; Commentary:


(require 'package)

;;; Code:
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Auto-download archive if missing
(when (not package-archive-contents) (package-refresh-contents))

;; Auto-download missing packages
(defvar my-packages '(
                      exec-path-from-shell
                      ruby-compilation
                      chruby
                      magit
                      git-gutter
                      multiple-cursors
                      markdown-mode
                      org
                      ruby-electric
                      scpaste
                      smex
                      textmate
                      lua-mode
                      gist
                      idle-highlight-mode
                      yaml-mode
                      coffee-mode
                      cider
                      clojure-mode
                      paredit
                      ace-jump-mode
                      projectile
                      emmet-mode
                      spacegray-theme
                      guru-mode
                      company
                      company-cider
                      ace-jump-mode
                      flycheck
                      multiple-cursors
                      expand-region
                      goto-chg
                      sublimity
                      )
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

(provide 'packages)
;;; packages.el ends here
