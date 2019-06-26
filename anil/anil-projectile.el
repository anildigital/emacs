;; Projectile mod
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)



(require 'org-projectile)
(setq org-projectile-projects-file
      "~/org/todo.org")
(push (org-projectile-project-todo-entry) org-capture-templates)
(setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
