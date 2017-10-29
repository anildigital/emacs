;; Flycheck mode
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Flyspell
(require 'flyspell-popup)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-;") #'flyspell-popup-correct)
