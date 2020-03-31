;; ;; recentf mode
;; (require 'recentf)
;; 
;; 


(use-package recentf
  :ensure nil
  :init
  (setq recentf-max-menu-items 25)
  :config
  (recentf-mode 1)
  )
