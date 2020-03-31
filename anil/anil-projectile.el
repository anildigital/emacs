(use-package projectile
  :ensure t
  :init
 (setq projectile-enable-caching t)
 (setq projectile-completion-system 'ivy)
 (setq projectile-globally-ignored-file-suffixes '(".png" ".gif" ".pdf"  "*.class", "*.beam"))
  :config
  (projectile-global-mode)
  )



(use-package counsel-projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )



(use-package org-projectile
  :ensure t
  :init
  (setq org-projectile-projects-file
        "~/org/todo.org")
  ;; TODO fix this
;  (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
  :config
  (push (org-projectile-project-todo-entry) org-capture-templates)
  )

