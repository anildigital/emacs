;; theme
(use-package
  vscode-dark-plus-theme
  :straight t
  :init
  ;; Remove the border around the TODO word on org-mode files
  (setq vscode-dark-plus-box-org-todo nil)

  ;; Do not set different heights for some org faces
  (setq vscode-dark-plus-scale-org-faces nil)
  :config
  (load-theme 'vscode-dark-plus t)
  (custom-set-faces
   '(mode-line ((t (:background "turquoise3" :foreground "#fafafa" :weight normal))))
   '(mode-line-inactive ((t (:background "turquoise4" :foreground "#d4d4d4" :weight normal)))))
  )
