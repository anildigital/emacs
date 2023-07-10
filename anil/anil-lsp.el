(use-package
  lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  ((elixir-ts-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)
   )
  :init
  (setq lsp-elixir-ls-server-dir "~/Code/elixir-ls/release")
  (add-to-list 'exec-path "~/Code/elixir-ls/release")
  (setq lsp-prefer-capf t)
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500)
   :custom
  (lsp-restart 'ignore)
  (lsp-file-watch-threshold 1000000)
  (lsp-auto-guess-root t)
  (lsp-response-timeout 2)
  (lsp-prefer-flymake nil)
  (lsp-elixir-suggest-specs t)
  :config
  (custom-set-variables '(lsp-credo-version "0.1.3"))
  (dolist (match
           '("[/\\\\].direnv$"
             "[/\\\\]node_modules$"
             "[/\\\\]deps"
             "[/\\\\]priv"
             "[/\\\\]build"
             "[/\\\\]_build"))
    (add-to-list 'lsp-file-watch-ignored match))
  :bind
  (:map lsp-mode-map
        ("C-; d" . eldoc-doc-buffer)
        ("C-; a" . lsp-execute-code-action)
        ("C-; r" . lsp-rename)
        ("C-; f" . xref-find-references)
        ("C-; i" . lsp-find-implementation)
        ("C-; =" . lsp-format-buffer)
        ("C-; o" . lsp-organize-imports)
        ("M-n" . forward-paragraph)
        ("M-p" . backward-paragraph)
          )
  )

(use-package
  lsp-treemacs
  :after (lsp-mode)
  :ensure t
  :commands lsp-treemacs
  :config (lsp-treemacs-sync-mode 1))

(use-package
  lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom (lsp-ui-flycheck-enable t)
  (lsp-ui-peek-enable t)
  (lsp-ui-imenu-buffer-enable)
  (lsp-ui-sideline-enable t)
  (lsp-ui-doc-enable t)
  :hook (lsp-ui-doc-frame-mode . (lambda()
                                   (display-line-numbers-mode -1)))
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("M-i" . lsp-ui-doc-focus-frame))
  (:map lsp-mode-map
        ("M-n" . forward-paragraph)
        ("M-p" . backward-paragraph))
  )

(use-package
  lsp-origami
  :ensure t
  :init (setq lsp-enable-folding t)
  :after lsp-mode
  :hook (lsp-after-open . lsp-origami-try-enable)
  :config (with-eval-after-load 'origami (define-key origami-mode-map (kbd "M-=")
                                           'origami-recursively-toggle-node)
                                (define-key origami-mode-map (kbd "M-+")
                                  'origami-toggle-all-nodes)))
