;; Use common lisp stuff

(require 'cl)

(add-to-list 'load-path "~/.emacs.d")

;; You're expected to populate .emacs.d/local.el
;; with your own code. This file is under .gitignore
;; so it won't be version-controlled. The idea is to
;; make this file load other version-controlled files.
(load "local") 

(autoload 'typing-of-emacs "typing" "The Typing Of Emacs, a game." t) 

(setq menu-bar-mode -1)

(setq nxml-sexp-element-flag t)

(windmove-default-keybindings 'meta)
