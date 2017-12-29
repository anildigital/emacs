;; Magit is an interface to Git for Emacs
(require 'magit)
(custom-set-faces
  '(diff-added ((t (:foreground "green3"))) 'now)
  '(diff-removed ((t (:foreground "red3"))) 'now)
  );


(add-hook 'git-commit-setup-hook #'git-commit-turn-on-flyspell)
