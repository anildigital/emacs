;; treemacs
(require 'treemacs)
(require 'treemacs-projectile)

(define-key treemacs-mode-map (kbd "SPC") (lambda () (interactive) (treemacs-visit-node-no-split t)))
