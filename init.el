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

(server-start)

;; Shows load time message
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
																		 (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
