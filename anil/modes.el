;; ;; save place in files between Sessions
;; (require 'saveplace)
;;

;; (use-package saveplace
;;   :ensure nil
;;   :init
;;   (setq-default save-place t)
;;   )

(use-package sh-mode
  :ensure nil
  :init
  :mode (
         (".aliases" . sh-mode)
         (".bash_profile" . sh-mode)
         (".bashrc" . sh-mode)
         )
  )

(use-package dockerfile-mode
  :ensure t
  :init
  :mode (
         ("\\Dockerfile\\'" . dockerfile-mode)
         ("Dockerfile" . dockerfile-mode)
         )
  )

(use-package pytyon-mode
  :ensure nil
  :mode (("\\.py?\\'" . python-mode))
  )


(use-package guru-mode
  :ensure t
  :config
  (guru-global-mode +1)
  )

(use-package diff-hl
  :ensure t
  :init
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :config
  (diff-hl-mode 1)
  (diff-hl-dired-mode 1)
  (diff-hl-flydiff-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-amend-mode 1)
  )

(use-package ace-jump-mode
  :ensure t
  :config
  (autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)
  )


(use-package move-text
  :ensure t
  :config
  (move-text-default-bindings)            ;
  )


(use-package multiple-cursors
  :ensure t
  )


;; (use-package go-mode
;;   :ensure t
;;   :mode (
;;          ("\\.go?\\'" . go-mode)
;;          ))

(use-package less-css-mode
  :ensure t
  :mode (
         ("\\.less$" . less-css-mode)
         ))


;; TODO check this
(use-package subword
  :ensure nil
  :init
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  (add-hook 'prog-mode-hook 'subword-mode)
  )


;; (use-package winner-mode
;;   :ensure t
;;   :config
;;   (winner-mode 1))

(use-package avy
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-side-window-right)
  )

;; On save remove trailing white space
(add-hook 'prog-mode-hook #'nuke_traling)

;; ;; desktop-save mode
;; ;; Automatically save and restore sessions
(desktop-save-mode 1)

;; ;; browse-at-remote
;; (require 'browse-at-remote)

(use-package browse-at-remote
  :ensure t)

(use-package elisp-format
  :ensure t
  )


;; ;; Erlang mode
(add-to-list 'auto-mode-alist '("\\.*erl\\'" . erlang-mode))


(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode 1)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  )


(use-package ripgrep
  :ensure t)

(use-package projectile-ripgrep
  :ensure t)


;; ;; ripgrep
;; (require 'ripgrep)
;; (require 'projectile-ripgrep)

(use-package dimmer
  :ensure t
  :init
  (setq dimmer-fraction 0.2)
  :config
  (dimmer-mode)
  )

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  )


(use-package volatile-highlights
  :ensure t

  :config
  (volatile-highlights-mode t)

  )


;; ;; volatile mode
;;
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(use-package polymode
  )
(use-package poly-markdown
  :ensure t
  :mode (("\\.md" . poly-markdown-mode))
  )


(use-package wsd-mode
  :ensure t
  :init
  (setq wsd-style "default")
  )

(use-package expand-region
  :ensure t
  :init
  (bind-key (kbd "C-=") 'er/expand-region)
  )
;; this is last change


(use-package goto-chg
  :ensure t
  :config
  (global-set-key [(control ?.)] 'goto-last-change)
  (global-set-key [(control ?,)] 'goto-last-change-reverse)
  )


(use-package swiper
  :ensure t
  :config
  (global-set-key "\M-gs" 'swiper)
  (global-set-key "\C-s" 'swiper)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-s-'") 'swiper-avy)
  (global-set-key (kbd "C-M-'") 'swiper-avy)
  )


(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key "\C-x\ \C-f" 'counsel-find-file)
  )

(use-package counsel-dash
  :ensure t
  :config
  (global-set-key "\C-c\ \C-o" 'counsel-dash)
  )


(use-package ruby-compilation
  :ensure t
  )
(use-package elisp-format
  :ensure t
  )
(use-package magit
  :ensure t
  )
(use-package git-lens
  :ensure t
  )
(use-package markdown-mode
  :ensure t
  )
(use-package projectile
  :ensure t
  )
(use-package org
  :ensure t
  )
(use-package org-bullets
  :ensure t
  )
(use-package org-projectile
  :ensure t
  )
(use-package robe
  :ensure t
  )
(use-package ruby-electric
  :ensure t
  )
(use-package rubocop
  :ensure t
  )
(use-package rbenv
  :ensure t
  )
(use-package scpaste
  :ensure t
  )
(use-package dash
  :ensure t
  )
(use-package dash-at-point
  :ensure t
  )
(use-package gist
  :ensure t
  )
(use-package yaml-mode
  :ensure t
  )
(use-package elm-mode
  :ensure t
  )
(use-package go-mode
  :ensure t
  )
(use-package paredit
  :ensure t
  )
(use-package which-key
  :ensure t
  )
(use-package avy
  :ensure t
  )
(use-package ace-window
  :ensure t
  )
(use-package dockerfile-mode
  :ensure t
  )
(use-package emmet-mode
  :ensure t
  )
(use-package web-mode
  :ensure t
  )
(use-package guru-mode
  :ensure t
  )
(use-package company
  :ensure t
  )
(use-package flycheck
  :ensure t
  )
(use-package expand-region
  :ensure t
  )
(use-package goto-chg
  :ensure t
  )
(use-package ripgrep
  :ensure t
  )
(use-package projectile-ripgrep
  :ensure t
  )
(use-package move-text
  :ensure t
  )
(use-package smartparens
  :ensure t
  )
(use-package discover-my-major
  :ensure t
  )
(use-package js2-mode
  :ensure t
  )
(use-package git-timemachine
  :ensure t
  )
(use-package rainbow-mode
  :ensure t
  )

(use-package editorconfig
  :ensure t
  )
(use-package feature-mode
  :ensure t
  )
(use-package react-snippets
  :ensure t
  )
(use-package less-css-mode
  :ensure t
  )
(use-package ido-vertical-mode
  :ensure t
  )
(use-package paradox
  :ensure t
  )
(use-package wsd-mode
  :ensure t
  )
(use-package flycheck-elm
  :ensure t
  )
(use-package flycheck-elixir
  :ensure t
  )
(use-package flycheck-dialyxir
  :ensure t
  )
(use-package bind-key
  :ensure t
  )
(use-package cask
  :ensure t
  )
(use-package exec-path-from-shell
  :ensure t
  )
(use-package flycheck-cask
  :ensure t
  )
(use-package htmlize
  :ensure t
  )
(use-package multiple-cursors
  :ensure t
  )
(use-package s
  :ensure t
  )
(use-package use-package
  :ensure t
  )
(use-package yasnippet
  :ensure t
  )
(use-package yasnippet-snippets
  :ensure t
  )
(use-package dracula-theme
  :ensure t
  )
(use-package elixir-yasnippets
  :ensure t
  )
(use-package flyspell-popup
  :ensure t
  )
(use-package browse-at-remote
  :ensure t
  )
(use-package hydra
  :ensure t
  )
(use-package swiper
  :ensure t
  )
(use-package ivy
  :ensure t
  )
(use-package counsel
  :ensure t
  )
(use-package counsel-projectile
  :ensure t
  )
(use-package counsel-dash
  :ensure t
  )
(use-package counsel-world-clock
  :ensure t
  )
(use-package ox-pandoc
  :ensure t
  )
(use-package helm-org-rifle
  :ensure t
  )
(use-package fish-completion
  :ensure t
  )
(use-package erlang
  :ensure t
  )
(use-package smart-mode-line
  :ensure t
  )
(use-package diff-hl
  :ensure t
  )
(use-package terraform-mode
  :ensure t
  )
(use-package restclient
  :ensure t
  )
(use-package dimmer
  :ensure t
  )
(use-package ag
  :ensure t
  )
(use-package graphql-mode
  :ensure t
  )
(use-package nvm
  :ensure t
  )
(use-package indium
  :ensure t
  )
(use-package eglot
  :ensure t
  )
(use-package anzu
  :ensure t
  )
(use-package zop-to-char
  :ensure t
  )
(use-package super-save
  :ensure t
  )
(use-package imenu-anywhere
  :ensure t
  )
(use-package volatile-highlights
  :ensure t
  )
(use-package org-ac
  :ensure t
  )
(use-package polymode
  :ensure t
  )
(use-package poly-markdown
  :ensure t
  )
(use-package exunit
  :ensure t
  )
(use-package wakatime-mode
  :ensure t
  )
(use-package edit-indirect
  :ensure t
  )




;; ;; (use-package global-so-long
;; ;;   :ensure t
;; ;;   :config
;; ;;   (global-so-long-mode 1)
;; ;;   )
