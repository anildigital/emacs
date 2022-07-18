(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :config (global-copilot-mode)
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
         ("RET" . #'copilot-accept-completion)
         ("<tab>" . #'copilot-accept-completion-by-line)
         ("C-<tab>" . #'copilot-accept-completion-by-word)
         ("C-n" . #'copilot-next-completion)
         ("C-p" . #'copilot-previous-completion)))
