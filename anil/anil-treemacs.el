(use-package treemacs
  :ensure t
  :after prog-mode
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :bind (("M-s M-s" . anil-treemacs-swiper)
         ("C-s-1" . treemacs)
         ("C-c 1" . treemacs)
         ("s-0" . treemacs-select-window)
         ("C-s-s" . treemacs-select-window)
         ("C-c 0" . treemacs)
         ("s-!" . treemacs-add-and-display-current-project)
         ("C-c h h" . browse-at-remote)
         ;; ("C-x 1" . treemacs-delete-other-windows)
         ("M-s M-s" . anil-treemacs-swiper)
         ("C-s-w" . treemacs-switch-workspace)
         :map prog-mode-map
         ("C-c C-p" . 'treemacs-projectile)
         )
  :hook
  (treemacs-mode . (lambda () (display-line-numbers-mode 0)))
  :config
  (progn
    (setq projectile-switch-project-action 'treemacs-projectile)
    (define-key treemacs-mode-map (kbd "SPC") (lambda () (interactive) (treemacs-visit-node-no-split t)))
    (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-width                         35)

    ))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)


(use-package treemacs-perspective
  :after (treemacs perspective)
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))
