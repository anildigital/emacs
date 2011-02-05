(autopair-global-mode)

;; use autopair everywhere but ruby buffers 
(add-hook 'ruby-mode-hook
            #'(lambda () (setq autopair-dont-activate t)))
 
