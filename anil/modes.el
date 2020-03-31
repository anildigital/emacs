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


(use-package go-mode
  :ensure t
  :mode (
         ("\\.go?\\'" . go-mode)
         ))

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


;; (use-package global-so-long
;;   :ensure t
;;   :config
;;   (global-so-long-mode 1)
;;   )
