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
  (custom-set-faces
   '(mode-line ((t (:background "turquoise3" :foreground "#fafafa" :weight normal))))
   '(mode-line-inactive ((t (:background "turquoise4" :foreground "#d4d4d4" :weight normal)))))
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
              centaur-tabs-cycle-scope 'tabs)
  :config (centaur-tabs-mode t)
  ;; (centaur-tabs-headline-match)
  ;; (centaur-tabs-group-by-projectile-project)
  :hook
  ((eshell-mode . centaur-tabs-local-mode)
   (dired-mode . centaur-tabs-local-mode))
  (org-agenda-mode . centaur-tabs-local-mode)
  :bind ("s-{" . centaur-tabs-backward)
  ("s-}" . centaur-tabs-forward))
