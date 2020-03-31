;; ;; elixir mode

(use-package elixir-mode
  :ensure t
  :config
  (add-hook 'elixir-mode-hook
            (lambda () (add-hook 'before-save-hook 'eglot-format-buffer nil t)))
  (add-hook 'elixir-mode-hook 'flycheck-mode)
  (add-hook 'elixir-mode-hook #'smartparens-mode)
  (add-hook 'elixir-mode-hook 'eglot-ensure)
  )



(use-package flycheck-elixir
  :ensure t
  )

(use-package flycheck-mix
  :ensure t
  :init
  (flycheck-mix-setup)
  )


(use-package eglot
  :ensure t
  :config
  (add-to-list 'eglot-server-programs `(elixir-mode "/Users/anil/Code/elixir-ls/release/language_server.sh"))
  )

(use-package exunit
  :ensure t
  )

(use-package flycheck-credo
  :ensure t
  )


(use-package flycheck-dialyxir
  :ensure t
  )

(use-package flycheck
  :no-require t
  :init
  :config
  (flycheck-credo-setup)
  (flycheck-dialyxir-setup)
  )


