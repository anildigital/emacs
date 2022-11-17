;; theme
(use-package
  vscode-dark-plus-theme
  :ensure t
  :init
  ;; Remove the border around the TODO word on org-mode files
  (setq vscode-dark-plus-box-org-todo nil)

  ;; Do not set different heights for some org faces
  (setq vscode-dark-plus-scale-org-faces nil)
  :config
  (load-theme 'vscode-dark-plus t)
  )

(use-package
  centaur-tabs
  :ensure t
  :after (vscode-dark-plus-theme)
  :demand
  :init (setq centaur-tabs-height 32
              centaur-tabs-set-icons t
              centaur-tabs-set-modified-marker t
              centaur-tabs-modified-marker "*"
              centaur-tabs-style "chamfer"
              centaur-tabs-gray-out-icons 'buffer centaur-tabs-set-bar 'over
              centaur-tabs-cycle-scope 'tabs
              )
  :config (centaur-tabs-mode t)
  ;; (centaur-tabs-headline-match)
  ;; (centaur-tabs-group-by-projectile-project)
  :hook
  ((eshell-mode . centaur-tabs-local-mode)
   (dired-mode . centaur-tabs-local-mode))
  (org-agenda-mode . centaur-tabs-local-mode)
  :bind ("s-{" . centaur-tabs-backward)
  :bind
  ("s-1" . centaur-tabs-select-visible-tab)
  ("s-2" . centaur-tabs-select-visible-tab)
  ("s-3" . centaur-tabs-select-visible-tab)
  ("s-4" . centaur-tabs-select-visible-tab)
  ("s-5" . centaur-tabs-select-visible-tab)
  ("s-6" . centaur-tabs-select-visible-tab)
  ("s-7" . centaur-tabs-select-visible-tab)
  ("s-8" . centaur-tabs-select-visible-tab)
  ("s-9" . centaur-tabs-select-end-tab)
  ("s-}" . centaur-tabs-forward))
