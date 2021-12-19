(use-package tree-sitter
  :ensure t
  :hook ((elixir-mode . tree-sitter-mode))
)

(use-package tree-sitter-langs
  :ensure t
  :after tree-sitter
  :config
  (add-to-list 'tree-sitter-major-mode-language-alist '(elixir-mode . elixir)))
