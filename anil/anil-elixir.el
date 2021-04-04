;; ;; elixir mode
(use-package
  erlang
	:ensure t
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
              ("s-t" . lsp-ui-imenu)))

(use-package
  exunit
  :ensure t
	:after elixir-mode
	)

(use-package
  flycheck-dialyxir
  :ensure t
	:after elixir-mode
	)

(use-package
  flycheck-credo
  :ensure t
  :after (flycheck elixir-mode)
  :custom (flycheck-elixir-credo-strict t))

(use-package
  flycheck-dialyxir
  :ensure t
	:after elixir-mode
	)

(use-package
  flycheck
  :no-require t
  :init (flycheck-dialyxir-setup))

(use-package inf-elixir
	:ensure t
	:after elixir-mode
  :bind (("C-c i i" . 'inf-elixir)
         ("C-c i p" . 'inf-elixir-project)
         ("C-c i l" . 'inf-elixir-send-line)
         ("C-c i r" . 'inf-elixir-send-region)
         ("C-c i b" . 'inf-elixir-send-buffer)))

(use-package
  mix
	:ensure t
  :after elixir-mode
	:hook (elixir-mode . mix-minor-mode)
	:bind ("s-e" . 'mix-test-current-buffer)
	)
