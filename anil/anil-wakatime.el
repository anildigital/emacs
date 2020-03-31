(use-package wakatime-mode
  :ensure t
  :init
  (setq wakatime-cli-path "/usr/local/bin/wakatime")
  (global-wakatime-mode)
  )
