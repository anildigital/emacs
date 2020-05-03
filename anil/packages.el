(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/"))


(when (< emacs-major-version 27)
  (package-initialize))

(setq use-package-verbose t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(progn ; `use-package'
  (setq use-package-verbose t)
  (require 'use-package))
