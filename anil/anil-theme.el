;; theme

(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))


(progn
  (global-tab-line-mode t)
  (set-face-attribute 'tab-line nil ;; background behind tabs
                      :background "#000000"
                      :foreground "#333333" :distant-foreground "#333333"
                      :family "Fira Sans Condensed" :height 1.0 :box '(:line-width 6 :color "#000000" :style nil))
  (set-face-attribute 'tab-line-tab nil ;; active tab in another window
                      :inherit 'tab-line
                      :foreground "#777777" :background "#111111" :box nil)
  (set-face-attribute 'tab-line-tab-current nil ;; active tab in current window
                      :background "#222222" :foreground "white" :box nil)
  (set-face-attribute 'tab-line-tab-inactive nil ;; inactive tab
                      :background "#333333" :foreground "#bbbbbb" :box nil)
  (set-face-attribute 'tab-line-highlight nil ;; mouseover
                      )
  )
