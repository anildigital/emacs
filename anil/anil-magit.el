(use-package
  magit
  :straight t
  :hook (git-commit-setup-hook . git-commit-turn-on-flyspell)
  ;; :config (custom-set-faces '(diff-added ((t
  ;;                                          (:foreground "green3"))) 'now)
  ;;                           '(diff-removed ((t
  ;;                                            (:foreground "red3"))) 'now)

  ;;                           )

  :bind
  ;; ("\C-cf" . 'forge-browse-remote)
  ("\C-xg" . 'magit-status)
  )

(use-package
  forge
  :straight t
  :after magit
  )
