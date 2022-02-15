(use-package
  lsp-mode
  :ensure t
  :diminish lsp-mode
  :hook
  ((elixir-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)
   )
  :commands lsp
  :custom (lsp-restart 'ignore)
  (lsp-file-watch-threshold 1000000)
  (lsp-auto-guess-root t)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake nil)
  :config (add-to-list 'exec-path "~/Code/elixir-ls/release")
  (setq lsp-prefer-capf t)
  (setq gc-cons-threshold 100000000)
  (setq lsp-elixir-dialyzer-enabled t)
  (setq lsp-elixir-dialyzer-warn-opts (list "error_handling" "no_behaviours" "no_contracts" "no_fail_call" "no_fun_app" "no_improper_lists" "no_match" "no_missing_calls" "no_opaque" "no_return" "no_undefined_callbacks" "no_unused" "unknown" "specdiffs"))q
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500))

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
  :config (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.asdf\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\deps\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\node_modules\\'"))


(use-package
  lsp-origami
  :ensure t
  :init (setq lsp-enable-folding t)
  :after lsp-mode
  :hook (lsp-after-open . lsp-origami-try-enable)
  :config (with-eval-after-load 'origami (define-key origami-mode-map (kbd "C-c f")
                                           'origami-recursively-toggle-node)
                                (define-key origami-mode-map (kbd "C-c F")
                                  'origami-toggle-all-nodes)))
