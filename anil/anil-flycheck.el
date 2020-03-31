;; Flycheck mode
(use-package flycheck
  :no-require t
  :init
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )

;; (use-package flyspell                   ;
;;   :ensure t
;;   ;; (define-key flyspell-mode-map (kbd "C-;") #'flyspell-popup-correct)
;;   ;; (define-key flyspell-mode-map (kbd "C-.") #'goto-last-change)
;;   )


(use-package flyspell-popup
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  )

