(use-package magit
  :ensure t
  :config
  (custom-set-faces
  '(diff-added ((t (:foreground "green3"))) 'now)
  '(diff-removed ((t (:foreground "red3"))) 'now)
  )
  (add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell)
  )

;; TODO check online for custom-set-faces
