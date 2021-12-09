;; theme

(use-package
  dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t)
  )

(use-package
  centaur-tabs
  :ensure t
  :after (dracula-theme)
  :demand
  :init (setq centaur-tabs-height 32 centaur-tabs-set-icons t centaur-tabs-set-modified-marker t
              centaur-tabs-modified-marker "*" centaur-tabs-style "chamfer"
              centaur-tabs-gray-out-icons 'buffer centaur-tabs-set-bar 'over
              centaur-tabs-cycle-scope 'tabs)
  :config (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (centaur-tabs-group-by-projectile-project)
  :hook (eshell-mode . centaur-tabs-local-mode)
  (org-agenda-mode . centaur-tabs-local-mode)
  :bind ("s-{" . centaur-tabs-backward)
  ("s-}" . centaur-tabs-forward))
