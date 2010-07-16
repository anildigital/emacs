(add-to-list 'load-path "~/.emacs.d/vendor")

; custom place to save customizations
(setq custom-file "~/.emacs.d/anil/custom.el")
(load custom-file)

(when (file-exists-p ".passwords") (load ".passwords"))

(load "anil/global")
(load "anil/preferences")
(load "anil/defuns")
(load "anil/modes")
(load "anil/dired")
(load "anil/theme")
(load "anil/shell")
(load "anil/bindings")
(load "anil/ruby")


(vendor 'full-ack)
(vendor 'cheat)
(vendor 'textile-mode)
(vendor 'magit)
(vendor 'cheat)
(vendor 'open-file-in-github)
(vendor 'google-define)
(vendor 'yaml-mode)
(vendor 'gist)
(vendor 'simplenote)
(vendor 'drag-stuff)
(vendor 'pastie)
(vendor 'yari)
(vendor 'rspec-mode)
(vendor 'ecb)