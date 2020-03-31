;; (if (eq system-type 'darwin)
;;     (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
;;   (progn (add-to-list 'load-path "~/.cask/")
;;    (require 'cask))
;;   )

;; (cask-initialize)
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(setq use-package-verbose t)


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(require 'use-package)

;;(use-package dracula-theme :ensure t)
