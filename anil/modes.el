(use-package
  sh-mode
  :straight nil
  :init
  :mode (".aliases" . sh-mode)
  (".bash_profile" . sh-mode)
  (".bashrc" . sh-mode))

(use-package
  dockerfile-mode
  :straight t
  :mode (("\\Dockerfile\\'" . dockerfile-mode)
         ("Dockerfile" . dockerfile-mode)))

(use-package
  python-mode
  :straight t
  :mode (("\\.py?\\'" . python-mode)))

(use-package
  diff-hl
  :straight t
  :after magit
  :hook ((magit-post-refresh-hook . diff-hl-magit-post-refresh))
  :config (global-diff-hl-mode)
  (diff-hl-dired-mode 1)
  (diff-hl-flydiff-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-amend-mode 1))

(use-package
  ace-window
  :straight t
  :bind ("C-o" . ace-window)
  ("C-c s" . ace-swap-window))

(use-package
  dimmer
  :straight t
  :config (dimmer-mode))

(use-package
  move-text
  :straight t
  :config (move-text-default-bindings)  ;
  )

(use-package
  multiple-cursors
  :straight t
  :bind ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

(use-package
  go-mode
  :straight t
  :mode (("\\.go?\\'" . go-mode)))

(use-package
  less-css-mode
  :straight t
  :mode (("\\.less$" . less-css-mode)))

;; TODO check this
(use-package
  subword
  :defer t
  :diminish subword-mode
  :hook ((prog-mode . subword-mode)))

(use-package
  avy
  :straight t
  :bind ("C-;" . avy-goto-char)
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
  :straight t
  :delight which-key-mode
  :config (which-key-mode)
  (which-key-setup-side-window-right))

(use-package
  browse-at-remote
  :straight t)

(use-package
  mini-frame
  :straight t
  :config
  (custom-set-variables
   '(mini-frame-show-parameters
     '((top . 600)
       (width . 0.7)
       (left . 0.5))))
  )

(use-package
  ripgrep
  :straight t
  :commands projectile-ripgrep)

(use-package
  undo-tree
  :straight t
  :init
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.saves/undo")))
  :commands undo-tree-visualize
  :bind
  ("C-x u" . undo-tree-visualize)
  :config (global-undo-tree-mode))

;; Assumes web-mode and elixir-mode are already set up
(use-package
   polymode
  :straight t
  :mode ("\\.ex\\'" . poly-elixir-web-mode)
  :init (setq web-mode-engines-alist '(("elixir" . "\\.ex\\'")))
  :config
  (define-hostmode poly-elixir-hostmode :mode 'elixir-mode)
  (define-innermode poly-surface-expr-elixir-innermode
    :mode 'web-mode
    :head-matcher (rx line-start (* space) "~F" (= 3 (char "\"'")) line-end)
    :tail-matcher (rx line-start (* space) (= 3 (char "\"'")) line-end)
    :head-mode 'host
    :tail-mode 'host
    :allow-nested nil
    :keep-in-mode 'host
    :fallback-mode 'host)
  (define-innermode poly-heex-expr-elixir-innermode
    :mode 'web-mode
    :head-matcher (rx line-start (* space) "~H" (= 3 (char "\"'")) line-end)
    :tail-matcher (rx line-start (* space) (= 3 (char "\"'")) line-end)
    :head-mode 'host
    :tail-mode 'host
    :allow-nested nil
    :keep-in-mode 'host
    :fallback-mode 'host)
  (define-polymode poly-elixir-web-mode
    :hostmode 'poly-elixir-hostmode
    :innermodes '(poly-surface-expr-elixir-innermode poly-heex-expr-elixir-innermode)))
(setq web-mode-engines-alist '(("elixir" . "\\.ex\\'")))

(use-package
  poly-markdown
  :straight t
  :after polymode
  :mode (("\\.md$" . poly-markdown-mode)))

(use-package
  dpaste
  :straight t
  :commands dpaste-buffer
  dpaste-region-or-buffer
  dpaste-region)

(use-package
  wsd-mode
  :straight t
  :commands wsd-mode
  :init (setq wsd-style "default"))

(use-package
  expand-region
  :straight t
  :commands er/expand-region
  :init (bind-key (kbd "C-=") 'er/expand-region))

;; this is last change0
(use-package
  goto-chg
  :straight t
  :after prog-mode
  :bind ("C-." . anil-goto-last-change)
  ("C-," . goto-last-change-reverse))

(use-package
  swiper
  :straight t
  :bind ("M-g s" . swiper)
  ("C-s" . swiper)
  ("C-M-'" . swiper-avy))

(use-package
  terraform-mode
  :straight t
  :mode (("\\.tf$" . terraform-mode)))

(use-package
  markdown-mode
  :straight t
  :init
  (setq markdown-fontify-code-blocks-natively t)
  :mode ("\\.md$" . markdown-mode)
  )

(use-package
  markdown-preview-mode
  :straight t
  :config
  (setq markdown-preview-stylesheets (list "http://thomasf.github.io/solarized-css/solarized-light.min.css"))
  )

(use-package
  dash
  :straight t)

(use-package
  yaml-mode
  :straight t
  :mode (".yaml" . yaml-mode)
  (".yml" . yaml-mode))

(use-package
  paredit
  :straight t
  :after emacs-lisp-mode
  clojure-mode)


(use-package
  emmet-mode
  :straight t
  :after web-mode
  :mode ("\\.html\\'" . emmet-mode)
  ("\\.eex$" . emmet--mode))

(use-package
  smartparens
  :straight t
  :delight smartparens
  :defer t)
(use-package
  discover-my-major
  :straight t
  :commands discover-my-major)

(use-package
  git-timemachine
  :straight (:repo "https://codeberg.org/pidu/git-timemachine.git")
  :ensure t
  :commands git-timemachine
  )

(use-package
  scss-mode
  :straight t
  :mode ("\\.scss\\'" . scss-mode))

(use-package
  rainbow-mode
  :straight t
  :mode ("\\.html\\'" . rainbow-mode)
  ("\\.eex$" . rainbow-mode)
  ("\\.css$" . rainbow-mode)
  ("\\.scss$" . rainbow-mode)
  ("\\.erb$" . rainbow-mode))

(use-package
  editorconfig
  :straight t
  :mode (".editorconfig" . editorconfig-mode))

(use-package
  feature-mode
  :straight t
  :defer t)

(use-package
  bind-key
  :straight t)

(use-package
  htmlize
  :straight t
  :defer t)

(use-package
  s
  :straight t
  :defer t)

(use-package
  counsel-world-clock
  :straight t
  :defer t)

(use-package
  restclient
  :straight t
  :defer t)

(use-package
  ag
  :straight t
  :commands counsel-ag)

(use-package
  graphql-mode
  :straight t
  :mode ("\\.graphql$" . graphql-mode))

(use-package
  anzu
  :straight t
  :commands anzu-query-replace)

(use-package
  zop-to-char
  :straight t)

(use-package
  super-save
  :straight t
  :delight super-save-mode
  :config (super-save-mode +1))

(use-package
  imenu-anywhere
  :straight t
  :commands imenu-anywhere)

(use-package
  nginx-mode
  :straight t
  :defer t)

(use-package
  git-gutter
  :straight t
  :hook (emacs-lisp-mode . git-gutter-mode)
  (markdown-mode . git-gutter-mode)
  (dockerfile-mode . git-gutter-mode)
  (ruby-mode . git-gutter-mode)
  (elixir-mode . git-gutter-mode)
  (js2-mode . git-gutter-mode)
  :config (git-gutter-mode))


(use-package deft
  :straight t
  :config
  (setq deft-extensions '("org")
        deft-directory "~/org"
        deft-recursive t
        deft-extensions '("md" "org")
        deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n"
        deft-use-filename-as-title t)
  :commands (deft)
  :bind
  (("<f13>" . deft)
  ("C-c n d" . deft))
  )

(use-package
  protobuf-mode
  :straight t
  :mode (("\\.proto$" . protobuf-mode))
  :bind
  ("M-]" . anil-align-to-equals)
  )

(use-package
  mermaid-mode
  :straight t
  :mode (("\\.mmd$" . mermaid-mode)))

(use-package
  all-the-icons
  :straight t)

(use-package
  winner
  :init (winner-mode))


(use-package
  annotate
  :straight t
  :hook ((prog-mode . annotate-mode))
  )

(use-package
  popper
  :straight t
  :bind (("C-`"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  ;; :hook (
  ;;        (popper-open-popup-hook . centaur-tabs-local-off)
  ;;        (vterm-mode-hook . centaur-tabs-local-off)
  ;;        )
  ;; :config
  ;; (defun centaur-tabs-local-off ()
  ;;  (centaur-tabs-local-mode 1))
  :init
  (setq popper-window-height 0.33)
  (setq popper-reference-buffers '("eshell*"
                                   "shell*"
                                   "vterm"
                                   "*SQL"
                                   "*exunit-compilation*"
                                   help-mode
                                   compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

(use-package
  persistent-scratch
  :straight t
  :config (persistent-scratch-setup-default))

(use-package link-hint
  :straight t
  :bind
  ("C-c l o" . link-hint-open-link)
  ("C-c l c" . link-hint-copy-link))


(use-package vterm
  :straight t
  :init
  (setq vterm-shell "/usr/local/bin/fish")
  (setq vterm-buffer-name-string "%s")
  :bind
  (:map vterm-mode-map
        ("C-o" . ace-window)
        ("C-s" . swiper)
        ("M-<" . beginning-of-buffer)
        ("M->" . end-of-buffer)
        ))

(use-package
  rainbow-delimiters
  :straight t
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package switch-buffer-functions
  :straight t
  :after recentf
  :preface
  (defun anil/recentf-track-visited-file (_prev _curr)
    (and buffer-file-name
         (recentf-add-file buffer-file-name)))
  :init
  (add-hook 'switch-buffer-functions #'anil/recentf-track-visited-file))
