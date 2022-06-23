(use-package tree-sitter
  :straight t
  :config
  (tree-sitter-hl-mode)
  :hook ((elixir-mode . tree-sitter-mode))
  )

(use-package tree-sitter-langs
  :straight t
  :after tree-sitter)
