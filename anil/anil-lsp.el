(use-package
  lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook (elixir-mode . lsp)
  :custom (lsp-restart 'ignore)
  (lsp-file-watch-threshold 5000)
  (lsp-auto-guess-root t)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake nil)
  :config
  (add-to-list 'exec-path "~/Code/elixir-ls/release")
  (setq lsp-prefer-capf t)
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq lsp-idle-delay 0.500))

(use-package
  posframe
  :ensure t)

(use-package
  company-posframe
  :ensure t
	:after posframe
  :config (company-posframe-mode 1))

(use-package
  lsp-treemacs
  :after (lsp-mode)
  :ensure t
  :commands lsp-treemacs
  :config (lsp-treemacs-sync-mode 1))

(use-package
  lsp-ui
  :ensure t
  :custom (lsp-ui-flycheck-enable t)
  (lsp-ui-peek-enable t)
  (lsp-ui-sideline-enable t)
  (lsp-ui-doc-enable t)
  :bind
  (:map lsp-ui-mode-map
        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ([remap xref-find-references] . lsp-ui-peek-find-references)
        ("M-i" . lsp-ui-doc-focus-frame))
  (:map lsp-mode-map
        ("M-n" . forward-paragraph)
        ("M-p" . backward-paragraph))
  :config (add-to-list 'lsp-file-watch-ignored "\\.asdf")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]node_modules$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.git$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.elixir_ls$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]deps$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]_build$"))


(use-package
	lsp-origami
	:ensure t
	:init
	(setq lsp-enable-folding t)
	:after lsp-mode
	:hook (lsp-after-open . lsp-origami-try-enable)
	:config
	(with-eval-after-load 'origami
    (define-key origami-mode-map (kbd "C-c f") 'origami-recursively-toggle-node)
    (define-key origami-mode-map (kbd "C-c F") 'origami-toggle-all-nodes)
		))
