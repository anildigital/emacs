;;; package --- Summary
;;; package.el
;;; Commentary:

(require 'package)

;;; Code:
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Auto-download archive if missing
(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))

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
                      perspective
                      org
                      robe
                      ruby-electric
                      enh-ruby-mode
                      scpaste
                      dash
                      textmate
                      dash-at-point
                      gist
                      idle-highlight-mode
                      yaml-mode
                      coffee-mode
                      elm-mode
                      cider
                      go-mode
                      clojure-mode
                      paredit
                      popup
                      avy
                      ace-window
                      dockerfile-mode
                      projectile
                      helm
                      helm-projectile
                      ensime
                      scala-mode
                      sbt-mode
                      grizzl
                      emmet-mode
                      web-mode
                      sublime-themes
                      guru-mode
                      company
                      flycheck
                      expand-region
                      goto-chg
                      ag
                      move-text
                      golden-ratio
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
                      flycheck-elm
                      flycheck-elixir
                      smooth-scrolling
                      )
  "A list of packages to ensure are installed at launch.")
(dolist (p my-packages) (when (not (package-installed-p p)) (package-install p)))

(provide 'packages)
;;; packages.el ends here
