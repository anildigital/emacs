
;; (require 'yaml-mode)
;; 
(use-package yaml-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  )

