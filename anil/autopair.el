(autopair-global-mode)

;; Use autopair everywhere but ruby buffers 
(add-hook 'ruby-mode-hook
            '(lambda () (setq autopair-dont-activate t)))

(add-hook 'js2-mode-hook
            '(lambda () (setq autopair-dont-activate t)))
 
