;;; init.el First thing to get loaded when Emacs starts.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:

(defvar *emacs-load-start* (current-time))

(setenv "LANG" "en_US.UTF-8")

;; Set paths
(add-to-list 'load-path (expand-file-name "~/.config/emacs/anil") t)
(add-to-list 'load-path (expand-file-name "~/.config/emacs/vendor") t)
(setq custom-file "~/.config/emacs/anil/custom.el")
(load custom-file)

;; load packages.el
(load "packages")
(setq package-check-signature nil)

(when (eq system-type 'darwin) (customize-set-variable 'native-comp-driver-options '("-Wl,-w")))

(load "path")
(load "anil-delight")
(load "anil-theme")
(load "local")
(load ".private")
(load "anil-font")
(load "anil-eglot")
(load "anil-ruby")
(load "anil-dash")
(load "anil-hydra")
(load "anil-flycheck")
(load "anil-js")
(load "anil-company")
(load "anil-markdown")
(load "anil-recentf")
(load "anil-magit")
(load "anil-counsel")
(load "anil-treemacs")
(load "anil-uniquify")
(load "anil-web")
(load "anil-yaml")
(load "anil-yasnippet")
(load "anil-ispell")
(load "anil-org")
(load "init-tree-sitter")
(load "anil-elixir")
(load "anil-postgres")
(load "anil-ido")
(load "defuns")
(load "modes")
(load "anil-projectile")
(load "preferences")
(load "backups")
(load "key-bindings")

(server-start)

(message (emacs-init-time))

(provide 'init)
;;; init.el ends here
