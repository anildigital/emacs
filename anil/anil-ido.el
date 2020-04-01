(use-package ido
  :init
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (setq ido-vertical-define-keys 'C-n-and-C-p-only)
  :config
  )

(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  )
