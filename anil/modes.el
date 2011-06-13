;; save place in files between Sessions
(require 'saveplace)
(setq-default save-place t)

;; uniquify buffer names.
(require 'uniquify)

;; enable speedbar mode
(speedbar 1)
(speedbar-add-supported-extension ".rb")

;; enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Recentf is a minor mode that builds a list of recently opened files. 
;; This list is is automatically saved across Emacs sessions.
;; You can then access this list through a menu.
(require 'recentf)
(recentf-mode 1)