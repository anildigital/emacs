(use-package
  company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'company-mode-hook
            (setq company-dabbrev-downcase nil))
  (add-to-list 'company-backends 'company-elm)
  (push 'company-robe company-backends))
