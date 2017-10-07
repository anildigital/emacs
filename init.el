;;; init.el First thing to get loaded when Emacs starts.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cl)

(defvar *emacs-load-start* (current-time))

;; Set paths
(add-to-list 'load-path (expand-file-name "~/.emacs.d/anil") t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor"))

(setq custom-file "~/.emacs.d/anil/custom.el")
(load custom-file)

;; load packages.el
(load "packages")

;; load preferences.el
(load "path")
(load "preferences")
(load "font")
(load "modes")
(load "defuns")
(load "ruby")
(load "textmate")
(load "ispell")
(load "irc")
(load "org")
(load "elixir")
(load "key-bindings")
(load "fullscreen")

(server-start)
