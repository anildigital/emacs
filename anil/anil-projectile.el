(use-package
  projectile
  :ensure t
  :bind (("s-p" . projectile-find-file)
         ("s-e" . projectile-recentf)
         ;; Press Command-b for fuzzy switch buffer
         ("s-b" . projectile-switch-to-buffer))
  :init (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-globally-ignored-file-suffixes '(".png" ".gif" ".pdf"  "*.class", "*.beam"))
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "elixir-ls")
  (add-to-list 'projectile-globally-ignored-directories "deps")
  :config (projectile-global-mode))


(use-package
  org-projectile
  :ensure t
  :bind (("C-c c" . org-capture)
         ("C-c n p" . org-projectile-project-todo-completing-read)))


(use-package
  counsel-projectile
  :ensure t
  :config (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))



(use-package
  org-projectile
  :ensure t
  :init (setq org-projectile-projects-file "~/org/todo.org")
  ;; TODO fix this
                                        ;  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  :config (push (org-projectile-project-todo-entry) org-capture-templates))


(use-package
  projectile-ripgrep
  :ensure t)
