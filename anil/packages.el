(if (eq system-type 'darwin)
    (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
  (progn (add-to-list 'load-path "~/.cask/")
   (require 'cask))
  )

(cask-initialize)
