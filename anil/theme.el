(require 'color-theme)
(setq color-theme-is-global t)

(setq default-frame-alist
       `((background-color . "darkslateblue")
         (foreground-color . "lightcyan")))

;(load-file "~/.emacs.d/vendor/njs-wheat-color-theme.el")
;(color-theme-njs-wheat)
(load-file "~/.emacs.d/vendor/twilight-emacs.el/color-theme-twilight.el")
(color-theme-twilight)

