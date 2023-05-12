;; ;; elixir mode
(use-package
  erlang
  :ensure t
  :mode "\\.erl$")

(use-package elixir-ts-mode
  :ensure t
  :hook
  (
   (elixir-ts-mode . flycheck-mode)
   (elixir-ts-mode . smartparens-mode)
   (elixir-ts-mode . tree-sitter-hl-mode)
   (elixir-ts-mode . mix-minor-mode)
   (elixir-ts-mode . exunit-mode)
   ;; (elixir-ts-mode . eglot-ensure)
   )
  ;; :config (add-hook 'elixir-ts-mode-hook (lambda ()
  ;;                                       (add-hook 'before-save-hook 'eglot-format-buffer)))
  :config
  (add-hook 'elixir-ts-mode-hook (lambda ()
                                   (add-hook 'before-save-hook 'lsp-format-buffer)))
  (load "~/.config/emacs/vendor/surface-ts-mode/surface-ts-mode.el")

  :bind
  (:map elixir-ts-mode-map
        ("C-c C-d" . lsp-ui-doc-show)
        ("s-t" . lsp-ui-imenu)
        )
  )

;; (use-package
;;   elixir-mode
;;   :ensure t
;;   :hook
;;   (
;;    (elixir-mode . flycheck-mode)
;;    (elixir-mode . smartparens-mode)
;;    (elixir-mode . tree-sitter-hl-mode)
;;    (elixir-mode . mix-minor-mode)
;;    (elixir-mode . exunit-mode)
;;    ;; (elixir-mode . eglot-ensure)
;;    )
;;   ;; :config (add-hook 'elixir-mode-hook (lambda ()
;;   ;;                                       (add-hook 'before-save-hook 'eglot-format-buffer)))
;;   :config (add-hook 'elixir-mode-hook (lambda ()
;;                                         (add-hook 'before-save-hook 'lsp-format-buffer)))
;;   :bind
;;   (:map elixir-mode-map
;;         ("C-c C-d" . lsp-ui-doc-show)
;;         ("s-t" . lsp-ui-imenu)
;;         )
;;   )

(use-package
  exunit
  :ensure t
  :after elixir-ts-mode
  :commands (anil/mix-format)
  :bind
  (:map elixir-ts-mode-map
        ("C-c , a" . exunit-verify-all)
        ("C-c , A" . exunit-verify-all-in-umbrella)
        ("C-c , s" . exunit-verify-single)
        ("C-c , v" . exunit-verify)
        ("C-c , r" . exunit-rerun)
        ("C-c , t" . exunit-toggle-file-and-test)
        ("s-r" . exunit-rerun)
        )
  (:map exunit-compilation-mode-map
        ("C-o" . ace-window))
  )

(use-package
  flycheck-credo
  :ensure t
  :after (flycheck elixir-ts-mode)
  :config
  (flycheck-credo-setup)
  :custom (flycheck-elixir-credo-strict t))

(use-package
  flycheck-dialyxir
  :ensure t
  :after elixir-ts-mode)

(use-package
  flycheck
  :no-require t
  :init (flycheck-dialyxir-setup))

(use-package
  inf-elixir
  :ensure t
  :after elixir-ts-mode
  :bind (("C-c i i" . 'inf-elixir)
         ("C-c i f" . anil/mix-format)
         ("C-c i p" . 'inf-elixir-project)
         ("C-c i l" . 'inf-elixir-send-line)
         ("C-c i r" . 'inf-elixir-send-region)
         ("C-c i b" . 'inf-elixir-send-buffer)))

(use-package
  mix
  :ensure t
  :after elixir-ts-mode
  :bind
  (:map elixir-ts-mode-map
        ("C-c i f" . anil/mix-format))
  :config
  (defun anil/mix-format ()
    (interactive)
    (save-buffer)
    (message "formatting code...")
    (shell-command (format "cd %s && mix format && mix surface.format"
                           (or
                            (ignore-errors (exunit-umbrella-project-root))
                            (exunit-project-root))
                           (buffer-file-name)))
    (revert-buffer t t))
  :hook (elixir-ts-mode . mix-minor-mode)
  )
