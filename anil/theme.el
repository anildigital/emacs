(require 'color-theme)
(setq color-theme-is-global t)
(when window-system 
  (load-file "~/.emacs.d/vendor/twilight-emacs.el/color-theme-twilight.el")
  (color-theme-twilight))