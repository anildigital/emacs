(use-package tree-sitter
  :ensure t
  :hook ((elixir-mode . tree-sitter-mode))
  )

(use-package tree-sitter-langs
  :after tree-sitter)
