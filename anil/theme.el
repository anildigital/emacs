(require 'color-theme)
(setq color-theme-is-global t)
(when window-system 
  (load-file "~/.emacs.d/vendor/njs-wheat-color-theme.el")
  (color-theme-njs-wheat))