(use-package
  company
  :ensure t
	:hook (after-init . global-company-mode)
  :config
  (setq company-dabbrev-downcase nil)
  (push 'company-robe company-backends))
