;;
;; (add-to-list 'yas-snippet-dirs "~/Code/yasnippet-snippets/snippets")

;; ;; yas

;; (provide 'yasnnipet)



;; (require 'yaml-mode)
;;
(use-package yasnippet
  :ensure t
  :init
  (setq yas-snippet-dirs '("~/.config/emacs/snippets"))
  :config
  (yas-reload-all)
  (yas-global-mode t)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
  (define-key yas-minor-mode-map (kbd "<C-return>") 'yas-expand)
  )
