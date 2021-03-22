;; theme

(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))

(use-package centaur-tabs
  :ensure t
  :demand
  :init
  (setq centaur-tabs-height 32)
  (setq centaur-tabs-set-icons t)
  (setq centaur-tabs-style "chamfer")
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-bar 'over)
  :config
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  :bind
  ("s-{" . centaur-tabs-backward)
  ("s-}" . centaur-tabs-forward))
