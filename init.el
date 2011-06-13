;;; init.el First thing to get loaded when Emacs starts.

(require 'cl)

(defvar *emacs-load-start* (current-time))
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; load paths.el
(load "paths")

(setq custom-file "~/.emacs.d/anil/custom.el")
(load custom-file)

;; load preferences.el
(load "anil/preferences")
(load "anil/modes")
(load "anil/theme")

;; Shows load time message
(message "My .emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
																		 (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))