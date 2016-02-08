;;; init.el First thing to get loaded when Emacs starts.
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
(load "modes")
(load "defuns")
(load "ruby")
(load "rake")
(load "lua")
(load "textmate")
(load "ispell")
(load "irc")
(load "org")
(load "elixir-mode")
(load "key-bindings")
(load "fullscreen")

(server-start)
