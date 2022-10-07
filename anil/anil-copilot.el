(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :config (with-eval-after-load 'company
  ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends))
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
         ("<tab>" . #'copilot-accept-completion-by-line)
         ("TAB" . #'copilot-accept-completion)
         ))
