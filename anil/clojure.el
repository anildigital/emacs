;; Clojure mode hook
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))
