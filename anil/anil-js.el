(use-package
  js2-mode
  :ensure t
  :mode ( ("\\.js?\\'" . js2-mode))
  :init (setq js2-strict-missing-semi-warning nil)
  (setq js2-missing-semi-one-line-override t)
  (setq js-indent-level 2)
  (setq-default indent-tabs-mode nil)
  (setq javascript-indent-level 2)
  :config (add-hook 'js2-mode-hook '(lambda ()
                                      (add-hook 'before-save-hook (lambda ()
                                                                    (untabify (point-min)
                                                                              (point-max)))))))
