;; Ensime
(require 'ensime)
(add-hook 'git-timemachine-mode-hook (lambda () (ensime-mode 0)))
(require 'ensime-expand-region)
