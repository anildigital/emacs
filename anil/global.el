(require 'cl)
(setq-default tab-width 2)
(setq inhibit-splash-screen t)
(setq-default indent-tabs-mode nil)
(prefer-coding-system 'utf-8)
(show-paren-mode 1)

;; works in both aquamacs and carbon
(when (functionp 'tool-bar-mode)
  (tool-bar-mode -1))