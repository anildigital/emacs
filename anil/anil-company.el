;; Company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'company-mode-hook '(lambda ()
                                (setq company-dabbrev-downcase nil)))

;; Robe backend for company mode
(eval-after-load 'company '(push 'company-robe company-backends))

;(add-to-list 'company-backends 'company-tern)
