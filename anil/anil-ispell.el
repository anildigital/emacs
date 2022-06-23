(use-package flyspell
  :functions
  flyspell-delay-command
  tex-mode-flyspell-verify
  :hook
  (text-mode-hook . flyspell-mode)
  :bind
  (:map flyspell-mode-map
        ("C-;" . flyspell-popup-correct))
  :config
  (define-key flyspell-mode-map (kbd "C-.") nil)
  )

(use-package flyspell-correct
  :straight t
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

(use-package flyspell-correct-popup
  :straight t
  :after flyspell-correct)
