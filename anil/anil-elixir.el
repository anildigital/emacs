;; ;; elixir mode
(use-package
  erlang
  :mode "\\.erl$")

(use-package
  elixir-mode
  :ensure t
  :hook (elixir-mode . lsp)
  (elixir-mode . flycheck-mode)
  (elixir-mode . smartparens-mode)
  (elixir-mode . mix-minor-mode)
  :config (add-hook 'elixir-mode-hook (lambda ()
                                        (add-hook 'before-save-hook 'lsp-format-buffer)
                                        (add-hook 'before-save-hook 'delete-trailing-whitespace)
                                        ))
  :bind (:map elixir-mode-map
              ("C-c C-d" . lsp-ui-doc-show)
              ("C-M-o" . lsp-ui-imenu)))

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
  :custom (flycheck-elixir-credo-strict t))

(use-package
  flycheck-dialyxir
  :ensure t)

(use-package
  flycheck
  :no-require t
  :init (flycheck-dialyxir-setup))


(use-package
  alchemist
  :ensure t
  :after elixir-mode
  :init (let ((fn (byte-compile (lambda ()
                                  (add-to-list (make-local-variable 'company-backends)
                                               'alchemist-company)))))
          (remove-hook 'alchemist-mode-hook fn)
          (remove-hook 'alchemist-iex-mode-hook fn))
  :config (remove-hook 'elixir-mode-hook #'alchemist-mode-hook))
