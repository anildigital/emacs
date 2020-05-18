(use-package
  sh-mode
  :ensure nil
  :init
  :mode ((".aliases" . sh-mode)
         (".bash_profile" . sh-mode)
         (".bashrc" . sh-mode)))

(use-package
  dockerfile-mode
  :ensure t
  :init
  :mode (("\\Dockerfile\\'" . dockerfile-mode)
         ("Dockerfile" . dockerfile-mode)))

(use-package
  python-mode
  :ensure t
  :mode (("\\.py?\\'" . python-mode)))


(use-package
  guru-mode
  :ensure t
  :config (guru-global-mode +1))

(use-package
  diff-hl
  :ensure t
  :hook ((magit-post-refresh-hook . diff-hl-magit-post-refresh))
  :config (global-diff-hl-mode)
  (diff-hl-dired-mode 1)
  (diff-hl-flydiff-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-amend-mode 1))

(use-package
  ace-jump-mode
  :ensure t
  :config (autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t))

(use-package
  ace-window
  :ensure t
  :bind ("C-o" . ace-window)
  ("M-p" . ace-window))

(use-package
  move-text
  :ensure t
  :config (move-text-default-bindings)  ;
  )


(use-package
  multiple-cursors
  :ensure t
  :bind ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

(use-package
  go-mode
  :ensure t
  :mode (("\\.go?\\'" . go-mode)))

(use-package
  less-css-mode
  :ensure t
  :mode (("\\.less$" . less-css-mode)))


;; TODO check this
(use-package subword
  :defer t
  :diminish subword-mode
  :hook (
         (before-save-hook . delete-trailing-whitespace)
         (prog-mode . subword-mode)
         ))

(use-package
  avy
  :ensure t
  :bind ("C-:" . avy-goto-char)
  ("C-'" . avy-goto-word-1)
  ("C-c u" . swiper-all)
  ("M-g f" . avy-goto-line)
  ("M-g e" . avy-goto-word-0)
  ("M-g w" . avy-goto-word-1)
  ("M-g t" . avy-goto-char-timer)
  ("C-c j" . avy-goto-word-or-subword-1)
  ("s-." . avy-goto-word-or-subword-1))

(use-package
  which-key
  :ensure t
  :config (which-key-mode)
  (which-key-setup-side-window-right))

(use-package
  browse-at-remote
  :ensure t)

(use-package
  elisp-format
  :ensure t)


(use-package
  ivy
  :ensure t
  :init (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind ("C-c C-r" . ivy-resume)
  :config (ivy-mode 1))


(use-package
  ripgrep
  :ensure t)


(use-package
  undo-tree
  :ensure t
  :config (global-undo-tree-mode))


(use-package
  volatile-highlights
  :ensure t
  :config (volatile-highlights-mode t))


(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(use-package
  polymode)
(use-package
  poly-markdown
  :ensure t
  :mode (("\\.md" . poly-markdown-mode)))

(use-package
  dpaste
  :ensure t

  )

(use-package
  wsd-mode
  :ensure t
  :init (setq wsd-style "default"))

(use-package
  expand-region
  :ensure t
  :init (bind-key (kbd "C-=") 'er/expand-region))

;; this is last change0
(use-package
  goto-chg
  :ensure t
  :bind ("C-." . goto-last-change)
  ("C-," . goto-last-change-reverse))


(use-package
  swiper
  :ensure t
  :bind ("M-g s" . swiper)
  ("C-s" . swiper)
  ("C-M-'" . swiper-avy))

(use-package
  erlang
  :mode (("\\.*erl\\'" . erlang-mode))
  :ensure t)

(use-package
  terraform-mode
  :ensure t
  :mode ((".tf" . terraform-mode)))

(use-package
  elisp-format
  :ensure t)
(use-package
  git-lens
  :ensure t)
(use-package
  markdown-mode
  :ensure t)
(use-package
  projectile
  :ensure t)
(use-package
  scpaste
  :ensure t)
(use-package
  dash
  :ensure t)
(use-package
  dash-at-point
  :ensure t)
(use-package
  gist
  :ensure t)
(use-package
  yaml-mode
  :ensure t)
(use-package
  paredit
  :ensure t)
(use-package
  which-key
  :ensure t)
(use-package
  dockerfile-mode
  :ensure t)
(use-package
  emmet-mode
  :ensure t)
(use-package
  web-mode
  :ensure t)
(use-package
  guru-mode
  :ensure t)
(use-package
  company
  :ensure t)
(use-package
  move-text
  :ensure t)
(use-package
  smartparens
  :ensure t)
(use-package
  discover-my-major
  :ensure t)
(use-package
  js2-mode
  :ensure t)
(use-package
  git-timemachine
  :ensure t)
(use-package
  rainbow-mode
  :ensure t)
(use-package
  editorconfig
  :ensure t)
(use-package
  feature-mode
  :ensure t)
(use-package
  less-css-mode
  :ensure t)
(use-package
  ido-vertical-mode
  :ensure t)
(use-package
  paradox
  :ensure t)
(use-package
  wsd-mode
  :ensure t)
(use-package
  flycheck-elm
  :ensure t)
(use-package
  bind-key
  :ensure t)
(use-package
  htmlize
  :ensure t)
(use-package
  s
  :ensure t)
(use-package
  dracula-theme
  :ensure t)
(use-package
  flyspell-popup
  :ensure t)
(use-package
  hydra
  :ensure t)
(use-package
  counsel-world-clock
  :ensure t)
(use-package
  ox-pandoc
  :ensure t)
(use-package
  helm-org-rifle
  :ensure t)
(use-package
  fish-completion
  :ensure t)
(use-package
  smart-mode-line
  :ensure t)
(use-package
  restclient
  :ensure t)
(use-package
  ag
  :ensure t)
(use-package
  graphql-mode
  :ensure t)
(use-package
  nvm
  :ensure t)
(use-package
  indium
  :ensure t)
(use-package
  anzu
  :ensure t)
(use-package
  zop-to-char
  :ensure t)
(use-package
  super-save
  :ensure t)
(use-package
  imenu-anywhere
  :ensure t)
(use-package
  org-ac
  :ensure t)
(use-package
  edit-indirect
  :ensure t)

(use-package lsp-ivy
  :ensure t)

(use-package nginx-mode
  :ensure t)
