(use-package
  magit
  :ensure t
  :hook (git-commit-setup-hook . git-commit-turn-on-flyspell)
  ;; :config (custom-set-faces '(diff-added ((t
  ;;                                          (:foreground "green3"))) 'now)
  ;;                           '(diff-removed ((t
  ;;                                            (:foreground "red3"))) 'now)

  ;;                           )

  :bind
  ;; ("\C-cf" . 'forge-browse-remote)
  ("\C-xg" . 'magit-status)
  :config
  (transient-append-suffix 'magit-push "-u"
    '(1 "=s" "Skip gitlab pipeline" "--push-option=ci.skip"))
  (transient-append-suffix 'magit-push "=s"
    '(1 "=D" "DEBUG" "--push-option=ci.variable=DEBUG=1"))  ;; no special meaning for gitlab
  (transient-append-suffix 'magit-push "=D"
    '(1 "=V" "Set CI variable" "--push-option=ci.variable="))  ;; Will prompt, can only set one extra variable
  (transient-append-suffix 'magit-push "=V"
    '(1 "=O" "Set push option" "--push-option="))  ;; Will prompt, can only set one extra push option
  )
