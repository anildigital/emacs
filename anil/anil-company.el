(use-package
  company
  :ensure t
  :delight company-mode
  :hook (after-init . global-company-mode)
  :config (setq company-dabbrev-downcase nil)
  (setq company-format-margin-function #'company-vscode-light-icons-margin)
  (push 'company-robe company-backends))


(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  )
