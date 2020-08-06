(use-package
  counsel
  :ensure t
  :bind ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x C-r" . counsel-recentf)
  ("s-r" . counsel-recentf))

(use-package
  counsel-dash
  :ensure t
  :init (setq counsel-dash-common-docsets '("Ruby", "Javascript" "HTML", "Elixir", "Phoenix"))
  (add-hook 'emacs-lisp-mode-hook (lambda ()
                                    (setq-local counsel-dash-docsets '("Emacs Lisp"))))
  (add-hook 'ruby-mode-hook (lambda ()
                              (setq-local counsel-dash-docsets '("Ruby"))))
  (add-hook 'ruby-mode-hook (lambda ()
                              (setq-local counsel-dash-docsets '("Phoenix"))))
  (setq counsel-dash-docsets-path "~/.docset")
  (setq counsel-dash-docsets-url "https://raw.github.com/Kapeli/feeds/master")
  (setq counsel-dash-min-length 3)
  (setq counsel-dash-candidate-format "%d %n (%t)")
  (setq counsel-dash-enable-debugging nil)
  (setq counsel-dash-browser-func 'browse-url)
  (setq counsel-dash-ignored-docsets nil)
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) "")
  :bind ("C-c C-o" . counsel-dash))
