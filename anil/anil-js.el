(use-package
  js2-mode
  :ensure t
	:hook
	((js-mode . smartparens-mode)
   (before-save . (lambda ()
                    (untabify (point-min)
                              (point-max)))))

	:mode
  ("\\.js\\'" . js2-mode)
	:config
	(setq js2-strict-missing-semi-warning nil)
	(setq js2-missing-semi-one-line-override t)
	(setq js-indent-level 2)
	(setq-default indent-tabs-mode nil)
	(setq javascript-indent-level 2)
	)

(use-package
	typescript-mode
	:ensure t
	:mode ("\\.ts?\\'" . typescript-mode)
	)
