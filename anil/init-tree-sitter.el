(use-package tree-sitter
  :ensure t
  :config
  (tree-sitter-hl-mode)
  :hook ((elixir-mode . tree-sitter-mode))
  )

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter)
