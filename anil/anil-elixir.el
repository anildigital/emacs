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
  :after elixir-mode
  :commands (anil/mix-format)
  :bind
  (:map elixir-mode-map
        ("C-c , a" . exunit-verify-all)
        ("C-c , A" . exunit-verify-all-in-umbrella)
        ("C-c , s" . exunit-verify-single)
        ("C-c , v" . exunit-verify)
        ("C-c , r" . exunit-rerun))
  (:map elixir-mode-map
        ("C-c i f" . anil/mix-format))
  (:map exunit-compilation-mode-map
        ("C-o" . ace-window))
  :config
  (defun anil/mix-format ()
    (interactive)
    (save-buffer)
    (shell-command (format "cd %s && mix format %s"
                           (or
                            (ignore-errors (exunit-umbrella-project-root))
                            (exunit-project-root))
                           (buffer-file-name)))
    (revert-buffer t t))
  )

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
