;; ;; elixir mode

(use-package erlang
  :mode "\\.erl$")


(use-package
  elixir-mode
  :ensure t
  :hook
  (elixir-mode . lsp)
  (elixir-mode . flycheck-mode)
  (elixir-mode . smartparens-mode)
  (elixir-mode . mix-minor-mode)

  :config
  (add-hook 'elixir-mode-hook (lambda ()
                                (add-hook 'before-save-hook 'lsp-format-buffer)))
  :bind
  (:map elixir-mode-map
        ("C-c C-d" . lsp-ui-doc-show)
        ("C-M-o" . lsp-ui-imenu)
        )
  )

(use-package
  lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook (elixir-mode . lsp)
  :init (add-to-list 'exec-path "/Users/anil/Code/elixir-ls/release")
  :custom
  (lsp-restart 'ignore)
  (lsp-file-watch-threshold 5000)
  (lsp-auto-guess-root t)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake nil)
  )

(use-package company-lsp
  :ensure t
  :commands company-lsp)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1)
  )

(use-package posframe
  :ensure t
  )

(use-package company-posframe
  :ensure t
  :config
  (company-posframe-mode 1)
  )

(use-package
  lsp-ui
  :ensure t
  :custom
  (lsp-ui-flycheck-enable t)
  (lsp-ui-peek-enable t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-doc-enable t)
  :config
  (add-to-list 'lsp-file-watch-ignored "\\.asdf")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]node_modules$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.git$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.elixir_ls$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]deps$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]_build$")
  )

(use-package
  exunit
  :ensure t)

(use-package
  flycheck-elixir
  :ensure t)

(use-package
  flycheck-dialyxir
  :ensure t)

(use-package
  flycheck-credo
  :ensure t
  :after (flycheck elixir-mode)
  :custom
  (flycheck-elixir-credo-strict t)
  )

(use-package
  flycheck-dialyxir
  :ensure t)

(use-package
  flycheck
  :no-require t
  :init
  (flycheck-dialyxir-setup))


(use-package alchemist
  :ensure t
  :after elixir-mode
  :init
  (let ((fn (byte-compile (lambda () (add-to-list (make-local-variable 'company-backends) 'alchemist-company)))))
    (remove-hook 'alchemist-mode-hook fn)
    (remove-hook 'alchemist-iex-mode-hook fn))
  :config
  (remove-hook 'elixir-mode-hook #'alchemist-mode-hook))
