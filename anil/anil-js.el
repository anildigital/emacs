(add-hook 'js2-mode-hook
  '(lambda ()
    (add-hook 'before-save-hook
       (lambda ()
         (untabify (point-min) (point-max))))))
(add-to-list 'auto-mode-alist '(".js" . js2-mode))
