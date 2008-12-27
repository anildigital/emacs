(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq mac-emulate-three-button-mouse nil)
(setq cua-highlight-region-shift-only t)
(prefer-coding-system 'utf-8)
(setq gist-view-gist t)

;; works in both aquamacs and carbon
(when (functionp 'tool-bar-mode)
  (tool-bar-mode))

;; aquamacs specific
(when (boundp 'aquamacs-version)
  (one-buffer-one-frame-mode 0))
