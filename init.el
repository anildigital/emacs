;;; init.el First thing to get loaded when Emacs starts.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; Code:
(package-initialize)

(defvar *emacs-load-start* (current-time))

;; Set paths
(add-to-list 'load-path (expand-file-name "~/.emacs.d/anil") t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor"))
(setq custom-file "~/.emacs.d/anil/custom.el")
(load custom-file)

;; load packages.el
(load "packages")

(load "path")
(load "anil-font")
(load "anil-ruby")
(load "anil-cider")
(load "anil-dash")
(load "anil-helm")
(load "anil-dired")
(load "anil-flycheck")
(load "anil-js")
(load "anil-elm")
(load "anil-company")
(load "anil-clojure")
(load "anil-coffee")
(load "anil-markdown")
(load "anil-recentf")
(load "anil-magit")
(load "anil-popwin")
(load "anil-popup")
(load "anil-polymode")
(load "anil-scala")
(load "anil-ensime")
;(load "anil-treemacs")
(load "anil-uniquify")
(load "anil-web")
(load "anil-writeroom")
(load "anil-yaml")
(load "anil-yasnippet")
(load "anil-textmate")
(load "anil-ispell")
(load "anil-org")
(load "anil-elixir")
(load "fullscreen")
(load "anil-ido")
(load "defuns")
(load "modes")
(load "hydras")
(load "anil-projectile")
(load "preferences")
(load "key-bindings")
(add-hook 'after-init-hook 'org-agenda-list)

(server-start)


(provide 'init)
;;; init.el ends here
