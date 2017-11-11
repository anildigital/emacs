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


;; TODO remove this if it gets available in official pacakge
(defun treemacs-visit-node-no-split (&optional arg)
  "Open current file or tag within `next-window'.
Stay in current window with a prefix argument ARG."
  (interactive "P")
  (when (one-window-p)
    (save-selected-window
      (split-window nil nil (if (eq 'left treemacs-position) 'right 'left))))
  (treemacs--execute-button-action
   :file-action (find-file (treemacs--safe-button-get btn 'abs-path))
   :dir-action (dired (treemacs--safe-button-get btn 'abs-path))
   :tag-action (treemacs--goto-tag btn)
   :save-window arg
   :no-match-explanation "Node is neither a file, a directory or a tag - nothing to do here."))
