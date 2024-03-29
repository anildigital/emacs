(use-package
  yasnippet
  :ensure t
  :after prog-mode
  :config
  (add-to-list 'yas-snippet-dirs "~/Code/yasnippet-snippets/snippets")
  (add-to-list 'yas-snippet-dirs "~/.config/emacs/snippets")
  (yas-reload-all)
  (yas-global-mode t)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "<C-return>") 'yas-expand)
  )

(use-package
  yasnippet-snippets
  :ensure t
  )

