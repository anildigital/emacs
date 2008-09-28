(add-to-list 'load-path "~/.emacs.d/vendor")

; custom place to save customizations
(setq custom-file "~/.emacs.d/anil/custom.el")
(load custom-file)

(load ".passwords")

(load "anil/global")
(load "anil/helpers")
(load "anil/modes")
(load "anil/theme")

(vendor 'cheat)
(vendor 'magit)
(vendor 'gist)
(vendor 'growl)
(vendor 'twittering-mode)
(vendor 'haml-mode)
