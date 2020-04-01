(use-package
  flycheck
  :no-require t
  :init
  :config (add-hook 'after-init-hook #'global-flycheck-mode))
