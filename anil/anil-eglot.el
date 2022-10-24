(use-package eglot
  :ensure t
  :init
  (setq eglot-stay-out-of '(flymake))
  :bind
  (:map eglot-mode-map
        ("M-i" . eldoc-doc-buffer)
        ("s-t" . counsel-imenu)
        ("C-; a" . eglot-code-actions)
        ("C-; r" . eglot-rename)
        ("C-; d" . eldoc-doc-buffer)
        ("C-; f" . xref-find-references)
        ("C-; i" . eglot-find-implementation)
        ("C-; =" . eglot-format)
        ("C-; o" . eglot-code-action-organize-imports)
        ("M-n" . forward-paragraph)
        ("M-p" . backward-paragraph)
        ))

(use-package eldoc-box
  :ensure t
  :hook
  (eglot-managed-mode . eldoc-box-hover-at-point-mode)
  (eglot-managed-mode-hook . (lambda ()
                               (add-to-list 'company-backends
                                            '(company-capf :with company-yasnippet))))
  :custom
  (eldoc-box-clear-with-C-g t)
  )
