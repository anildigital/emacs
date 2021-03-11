(use-package
  magit
  :ensure t
  :hook (git-commit-setup-hook . git-commit-turn-on-flyspell)
  :config (custom-set-faces '(diff-added ((t
                                           (:foreground "green3"))) 'now)
                            '(diff-removed ((t
                                             (:foreground "red3"))) 'now)))
(use-package
  forge
  :ensure t)
