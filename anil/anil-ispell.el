;; TODO verify this is right
(use-package flyspell
  :functions
  flyspell-delay-command
  tex-mode-flyspell-verify
  :config
  (define-key flyspell-mode-map (kbd "C-.") nil)
  )
