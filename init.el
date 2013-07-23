;;; init.el First thing to get loaded when Emacs starts.

(require 'cl)

(defvar *emacs-load-start* (current-time))

;; Set paths
;(setq exec-path (append exec-path '("/usr/local/bin")))

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; load paths.el
(load "paths")

(setq custom-file "~/.emacs.d/anil/custom.el")
(load custom-file)

;; load packages.el
(load "anil/packages")

;; load preferences.el
(load "anil/preferences")
(load "anil/modes")
(load "anil/defuns")
(load "anil/theme")
(load "anil/bindings")
(load "anil/dired")
(load "anil/ruby")
(load "anil/rake")
(load "anil/lua")
(load "anil/textmate")
(load "anil/ispell")


(server-start)
