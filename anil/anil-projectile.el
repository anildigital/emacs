(use-package
  projectile
  :ensure t
  :after prog-mode
  treemacs
  :hook (elixir-mode . projectile-mode)
  (elixir-mode . counsel-projectile-mode)
  :commands (projectile-find-file projectile-switch-project)
  :bind
  ("s-b" . projectile-recentf)
  ("C-x 5 k" . anil/projectile-kill-non-project-buffers)
  :bind-keymap
  ("s-p" . projectile-command-map)
  :init (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-globally-ignored-file-suffixes '(".png" ".gif" ".pdf"  ".class", ".beam"))
  :config (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "elixir-ls")
  (add-to-list 'projectile-globally-ignored-directories "deps")
  (add-to-list 'projectile-globally-ignored-directories "elpa")
  (add-to-list 'projectile-globally-ignored-directories "_build")
  (projectile-global-mode)

  (defun anil/projectile-kill-non-project-buffers ()
    "Kill all the buffers that doesn't belong to the current project."

    (interactive)
    (let ((root (projectile-project-root)) (bufs (buffer-list (selected-frame))))
      (when (null root) (user-error "Not in a Projectile buffer"))
      (when (yes-or-no-p (format "Do you want to kill all the buffers that doesn't belong to \"%s\"? " root))
        (dolist (buf bufs)
          (let ((buf-name (buffer-name buf)))
                                        ; " ?" -> Treemacs buffers has an space at the beginning, because potato.
            (unless (or (projectile-project-buffer-p buf root)
                        (string-match "^ ?\\*\\(\\scratch\\|\\timesheet\\|\\elixir-ls\\|Messages\\|Treemacs\\|tab-line-hscroll\\)" buf-name))

              (message "Killing buffer '%s'" buf-name)
              (kill-buffer buf)))))))

  )

(use-package
  org-projectile
  :ensure t
  :after org
  projectile
  :init (setq org-projectile-projects-file "~/org/todo.org")
  ;; Fix this (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  :bind (("C-c c" . org-capture)
         ("C-c n p" . org-projectile-project-todo-completing-read))
  :config (push (org-projectile-project-todo-entry) org-captre-templates))

(use-package
  counsel-projectile
  :ensure t
  :commands (projectile-command-map)
  :after projectile)

(use-package
  projectile-ripgrep
  :ensure t
  :after projectile)
