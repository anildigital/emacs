(use-package
  lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook (elixir-mode . lsp)
  :init (add-to-list 'exec-path "~/Code/elixir-ls/release")
  :custom
  (lsp-restart 'ignore)
  (lsp-file-watch-threshold 5000)
  (lsp-auto-guess-root t)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake nil)
  :config
  (setq lsp-prefer-capf t)
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500)
  )

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
  (lsp-ui-peek-enable nil)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-doc-enable nil)
  :config
  (add-to-list 'lsp-file-watch-ignored "\\.asdf")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]node_modules$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.git$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.elixir_ls$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]deps$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]_build$")
  )
