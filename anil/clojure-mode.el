(setq load-path (cons  "~/.emacs.d/vendor/clojure-mode" load-path))
(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(setq load-path (cons  "~/.emacs.d/vendor/swank-clojure" load-path))
(require 'swank-clojure)
(eval-after-load 'swank-clojure
  '(progn
     (add-to-list 'swank-clojure-init-files
                  (expand-file-name "~/.clojure/user.clj"))))

(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)

(provide 'clojure-init)