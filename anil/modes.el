(use-package
  sh-mode
  :ensure nil
  :init
  :mode (".aliases" . sh-mode)
  (".bash_profile" . sh-mode)
  (".bashrc" . sh-mode))

(use-package
  dockerfile-mode
  :ensure t
  :mode (("\\Dockerfile\\'" . dockerfile-mode)
         ("Dockerfile" . dockerfile-mode)))

(use-package
  python-mode
  :ensure t
  :mode (("\\.py?\\'" . python-mode)))

(use-package
  diff-hl
  :ensure t
  :after magit
  :hook ((magit-post-refresh-hook . diff-hl-magit-post-refresh))
  :config (global-diff-hl-mode)
  (diff-hl-dired-mode 1)
  (diff-hl-flydiff-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-amend-mode 1))

(use-package
  ace-window
  :ensure t
  :bind
	("C-o" . ace-window)
	("C-c s" . ace-swap-window)
	)

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
(use-package
  subword
  :defer t
  :diminish subword-mode
  :hook ((before-save-hook . delete-trailing-whitespace)
         (prog-mode . subword-mode)))

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
	:delight which-key-mode
  :config (which-key-mode)
  (which-key-setup-side-window-right))

(use-package
  browse-at-remote
  :ensure t)

(use-package
  ripgrep
  :ensure t
	:commands projectile-ripgrep
	)

(use-package
  undo-tree
  :ensure t
	:commands undo-tree-visualize
  :config (global-undo-tree-mode))

(use-package
  polymode
	:ensure t
	:after markdown-mode
	)

(use-package
  poly-markdown
  :ensure t
	:after polymode
  :mode (("\\.md$" . poly-markdown-mode)))

(use-package
  dpaste
  :ensure t
	:commands dpaste-buffer dpaste-region-or-buffer dpaste-region
	)

(use-package
  wsd-mode
  :ensure t
	:commands wsd-mode
  :init (setq wsd-style "default"))

(use-package
  expand-region
  :ensure t
	:commands er/expand-region
  :init (bind-key (kbd "C-=") 'er/expand-region))

;; this is last change0
(use-package
  goto-chg
  :ensure t
	:after prog-mode
  :bind ("C-." . goto-last-change)
  ("C-," . goto-last-change-reverse))

(use-package
  swiper
  :ensure t
  :bind ("M-g s" . swiper)
  ("C-s" . swiper)
  ("C-M-'" . swiper-avy))

(use-package
  terraform-mode
  :ensure t
  :mode (("\\.tf$" . terraform-mode)))

(use-package
  markdown-mode
  :ensure t
	:mode
	("\\.md$" . markdown-mode)
	)

(use-package
  scpaste
  :ensure t
	:defer t
	)

(use-package
  dash
  :ensure t)

(use-package
  yaml-mode
  :ensure t
	:mode
	(".yaml" . yaml-mode)
	(".yml" . yaml-mode)
	)

(use-package
  paredit
  :ensure t
	:after emacs-lisp-mode clojure-mode
	)


(use-package
  emmet-mode
  :ensure t
	:after web-mode
	:mode
	("\\.html\\'" . emmet-mode)
	("\\.eex$" . emmet--mode)
	)

(use-package
  smartparens
  :ensure t
	:delight smartparens
	:defer t
	)
(use-package
  discover-my-major
  :ensure t
	:commands discover-my-major
	)
(use-package
  git-timemachine
  :ensure t
  :commands git-timemachine
  )

(use-package
  scss-mode
  :ensure t
	:mode
  ("\\.scss\\'" . scss-mode)
  )

(use-package
  rainbow-mode
  :ensure t
	:mode
	("\\.html\\'" . rainbow-mode)
	("\\.eex$" . rainbow-mode)
	("\\.css$" . rainbow-mode)
	("\\.scss$" . rainbow-mode)
	("\\.erb$" . rainbow-mode)
	)

(use-package
  editorconfig
  :ensure t
  :mode (".editorconfig" . editorconfig-mode)
	)

(use-package
  feature-mode
  :ensure t
	:defer t
	)

(use-package
  bind-key
  :ensure t)

(use-package
  htmlize
  :ensure t
	:defer t
	)

(use-package
  s
  :ensure t
	:defer t
	)

(use-package
  counsel-world-clock
  :ensure t
	:defer t
	)

(use-package
  fish-completion
  :ensure t
	:init
	(setq eshell-scroll-to-bottom-on-output nil)
	(setq eshell-scroll-show-maximum-output nil)
	:commands (eshell))

(use-package
  restclient
  :ensure t
	:defer t
	)

(use-package
  ag
  :ensure t
	:commands counsel-ag
	)

(use-package
  graphql-mode
  :ensure t
	:mode ("\\.graphql$" . graphql-mode)
	)

(use-package
  nvm
  :ensure t
  :mode ("\\.js$" . nvm)
	)

(use-package
  anzu
  :ensure t
	:commands anzu-query-replace
	)

(use-package
  zop-to-char
  :ensure t)

(use-package super-save
  :ensure t
	:delight super-save-mode
  :config
  (super-save-mode +1))

(use-package
  imenu-anywhere
  :ensure t
	:commands imenu-anywhere
	)

(use-package
  nginx-mode
  :ensure t
	:defer t
	)

(use-package
  git-gutter
  :ensure t
	:hook
	(emacs-lisp-mode . git-gutter-mode)
	(markdown-mode . git-gutter-mode)
	(dockerfile-mode . git-gutter-mode)
	(ruby-mode . git-gutter-mode)
	(elixir-mode . git-gutter-mode)
	(js2-mode . git-gutter-mode)
  :config (git-gutter-mode))

(use-package
  deft
  :ensure t
  :bind ("<f13>" . deft)
  :commands (deft)
  :config (setq deft-directory "~/org" deft-extensions '("md" "org")))

(use-package
  perspective
  :ensure t
  :bind (("C-x C-b" . persp-list-buffers) ; or use a nicer switcher, see below
         ))

(use-package
  treemacs-perspective
  :after treemacs perspective
  :ensure t)

(use-package
  protobuf-mode
  :ensure t
  :mode (("\\.proto$" . protobuf-mode)
         ))

(use-package
  mermaid-mode
  :ensure t
  :mode (("\\.mmd$" . mermaid-mode)
         ))

(use-package all-the-icons
	:ensure t
	)

(use-package winner
  :init
  (winner-mode))

(use-package popper
  :ensure t ; or :straight t
  :bind (("C-`"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
					"\\*eshell\\*"
					"\\*elixir-ls\\*"
					"\\*Compile-Log\\*"
					"\\*Async-native-compile-log\\*"
					"\\*Flycheck error messages\\*"
          help-mode
          compilation-mode))
	:config
  (popper-mode +1))


(use-package
  persistent-scratch
  :ensure t
  :config
  (persistent-scratch-setup-default)
  )
