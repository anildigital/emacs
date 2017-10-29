;; treemacs
(require 'treemacs)
(require 'treemacs-projectile)

(setq projectile-switch-project-action 'treemacs-projectile)

(define-key treemacs-mode-map (kbd "SPC") (lambda () (interactive) (treemacs-visit-node-no-split t)))

(setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-git-integration            t
          treemacs-collapse-dirs              3
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          nil
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)
