;; ;; elixir mode

(use-package
  elixir-mode
  :ensure t
  :config
  (add-hook 'elixir-mode-hook 'flycheck-mode)
  (add-hook 'elixir-mode-hook #'smartparens-mode))

(use-package
  flycheck-mix
  :ensure t
  :init (flycheck-mix-setup))


(use-package
  lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook (elixir-mode . lsp)
  :init (add-to-list 'exec-path "/Users/anil/Code/elixir-ls/release")
  :config (defun my-elixir-mode-before-save-hook ()
            (when (eq major-mode 'elixir-mode)
              (lsp-format-buffer)))
  (add-hook 'before-save-hook #'my-elixir-mode-before-save-hook)
  )

(use-package
  lsp-ui
  :ensure t)

(use-package
  exunit
  :ensure t)

(use-package
  flycheck-credo
  :ensure t)


(use-package
  flycheck-dialyxir
  :ensure t)

(use-package
  flycheck
  :no-require t
  :init
  :config (flycheck-credo-setup)
  (flycheck-dialyxir-setup))
