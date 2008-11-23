(add-to-list 'load-path "~/.emacs.d/vendor")

; custom place to save customizations
(setq custom-file "~/.emacs.d/anil/custom.el")
(load custom-file)

(when (file-exists-p ".passwords") (load ".passwords"))

(load "anil/lisp")
(load "anil/defuns")
(load "anil/global")
(load "anil/helpers")
(load "anil/bindings")
(load "anil/modes")
(load "anil/theme")

(vendor 'cheat)
(vendor 'magit)
(vendor 'gist)
(vendor 'growl)
(vendor 'twittering-mode)
(vendor 'haml-mode)
(vendor 'ack)
(vendor 'fuzzy-find-in-project)
(vendor 'yasnippet)

;(add-to-list 'load-path "~/code/emacs/emacs.d/vendor/textmate.el/vendor/fuzzy-find-in-project")
;(load "vendor/textmate.el/textmate.el")
