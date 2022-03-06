;; ;; elixir mode
(use-package
  erlang
  :ensure t
  :mode "\\.erl$")

(use-package
  elixir-mode
  :ensure t
  :init
  (setq lsp-elixir-dialyzer-enabled t)
  (setq lsp-elixir-dialyzer-warn-opts (list "error_handling" "no_behaviours" "no_contracts" "no_fail_call" "no_fun_app" "no_improper_lists" "no_match" "no_missing_calls" "no_opaque" "no_return" "no_undefined_callbacks" "no_unused" "unknown" "specdiffs"))
  :hook
  ((elixir-mode . flycheck-mode)
   (elixir-mode . smartparens-mode)
   (elixir-mode . mix-minor-mode))
  :config (add-hook 'elixir-mode-hook (lambda ()
                                        (add-hook 'before-save-hook 'lsp-format-buffer)))
  :bind (:map elixir-mode-map
              ("C-c C-d" . lsp-ui-doc-show)
              ("s-t" . lsp-ui-imenu)))

(use-package
  exunit
  :ensure t
  :after elixir-mode)

(use-package
  flycheck-dialyxir
  :ensure t
  :after elixir-mode)

(use-package
  flycheck-credo
  :ensure t
  :after (flycheck elixir-mode)
  :custom (flycheck-elixir-credo-strict t))

(use-package
  flycheck-dialyxir
  :ensure t
  :after elixir-mode)

(use-package
  flycheck
  :no-require t
  :init (flycheck-dialyxir-setup))

(use-package
  inf-elixir
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
  :bind ("s-r" . 'mix-test-current-buffer))
