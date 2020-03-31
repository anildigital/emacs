(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'company-mode-hook
            (setq company-dabbrev-downcase nil))
  (push 'company-robe company-backends)
  )
