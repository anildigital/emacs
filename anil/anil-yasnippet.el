;; yasnippets
(require 'yasnippet)
(yas-global-mode t)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(add-to-list 'yas-snippet-dirs "~/Code/yasnippet-snippets/snippets")

;; yas
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<C-return>") 'yas-expand)

(provide 'yasnnipet)
