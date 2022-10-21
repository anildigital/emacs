(use-package
  recentf
  :ensure nil
  :init
  (setq recentf-max-menu-items 25)
  :config
  (recentf-mode 1)
  (setq recentf-filename-handlers
      (append '(abbreviate-file-name) recentf-filename-handlers))
  )
