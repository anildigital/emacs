;;; package --- Summary
;;; package.el
;;; Commentary:


(require 'package)

;;; Code:
(add-to-list 'package-archives
  '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

;; Auto-download archive if missing
(when (not package-archive-contents) (package-refresh-contents))

;; Auto-download missing packages
(defvar my-packages '(
                       exec-path-from-shell
                       ruby-compilation
                       chruby
                       magit
                       git-lens
                       yasnippet
                       git-gutter
                       multiple-cursors
                       markdown-mode
                       org
                       ruby-electric
                       scpaste
                       dash
                       textmate
                       lua-mode
                       gist
                       idle-highlight-mode
                       yaml-mode
                       coffee-mode
                       cider
                       clojure-mode
                       paredit
                       popup
                       avy
                       ace-window
                       dockerfile-mode
                       projectile
                       helm
                       ensime
                       scala-mode2
                       sbt-mode
                       grizzl
                       emmet-mode
                       web-mode
                       zenburn-theme
                       guru-mode
                       company
                       flycheck
                       expand-region
                       goto-chg
                       ag
                       move-text
                       smartparens
                       discover-my-major
                       js2-mode
                       git-timemachine
                       rainbow-mode
                       elixir-mode
                       alchemist
                       editorconfig
                       feature-mode
                       react-snippets
                       tern
                       company-tern
                       neotree
                       browse-kill-ring
                       less-css-mode
                       ido-vertical-mode
                       popwin
                       guide-key
                       paradox
                       wsd-mode
                       circe
                       twittering-mode
                       nyan-mode
                       )
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

(provide 'packages)
;;; packages.el ends here
