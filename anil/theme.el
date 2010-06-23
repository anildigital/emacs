(require 'color-theme)
(setq color-theme-is-global t)
(when window-system 
  (load-file "~/.emacs.d/vendor/zen-and-art.el")
  (color-theme-zen-and-art))