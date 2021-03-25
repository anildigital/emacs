(use-package
  dash-at-point
  :ensure t
	:commands dash-at-point
  :bind (("C-c d" . dash-at-point)
         ("C-c e" . dash-at-point-with-docset))
	)
