(require 'color-theme)
(setq color-theme-is-global t)


(add-to-list 'load-path "~/.emacs.d/vendor/emacs-color-theme-solarized/")

(require 'color-theme-solarized)
(color-theme-solarized-dark)