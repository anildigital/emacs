(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))

(defun lisp-path()
  (setenv "PATH"
          (concat
           "/usr/local/bin" ":"
           (getenv "PATH")
           ))
	(shell-command-to-string "which sbcl | grep -e '/sbcl$'"))

(defun load-slime()
	(add-to-list 'load-path "~/.emacs.d/vendor/slime")
	(setq inferior-lisp-program (lisp-path))
	(require 'slime)
	(slime-setup))


(if (< 0 (length (lisp-path)))
		(load-slime))

(lisp-path)

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)