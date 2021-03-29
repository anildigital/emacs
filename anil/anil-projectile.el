(use-package
  projectile
  :ensure t
	:after prog-mode
	:hook
	(elixir-mode . projectile-mode)
	(elixir-mode . counsel-projectile-mode)
	:commands (projectile-find-file projectile-switch-project)
  :bind (("s-p" . projectile-find-file)
         ("s-e" . projectile-recentf)
         ;; Press Command-b for fuzzy switch buffer
         ("s-b" . projectile-switch-to-buffer))
  :init
	(setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-globally-ignored-file-suffixes '(".png" ".gif" ".pdf"  "*.class", "*.beam"))
	:config
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "elixir-ls")
  (add-to-list 'projectile-globally-ignored-directories "deps")
  (add-to-list 'projectile-globally-ignored-directories "elpa")
  (projectile-global-mode))

(use-package
  org-projectile
  :ensure t
  :after org projectile
  :init
  (setq org-projectile-projects-file "~/org/todo.org")
  ;; Fix this (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  :bind (("C-c c" . org-capture)
         ("C-c n p" . org-projectile-project-todo-completing-read))

  :config
  (push (org-projectile-project-todo-entry) org-captre-templates)
  )

(use-package
  counsel-projectile
  :ensure t
	:after projectile
  :config
	(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package
  projectile-ripgrep
  :ensure t
	:after projectile
	)
