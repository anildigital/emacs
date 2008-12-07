;; Use common lisp stuff
(require 'cl)

(autoload 'typing-of-emacs "typing" "The Typing Of Emacs, a game." t)

(setq menu-bar-mode -1)

(setq nxml-sexp-element-flag t)
(windmove-default-keybindings 'meta)

(fset 'yes-or-no-p 'y-or-n-p) ; stop forcing me to spell out "yes"

(set tool-bar-mode nil)

; show extra whitespace
(setq show-trailing-whitespace t)

; delete trailing whitespace before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
 