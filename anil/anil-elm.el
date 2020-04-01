(use-package elm-mode
  :ensure t
  :init
  (add-hook 'flycheck-mode-hook #'flycheck-elm-setup)
  (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)
  (add-hook 'before-save-hook 'elm-mode-format-buffer)
  )
