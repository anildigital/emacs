(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-directory "~/org")

;; http://orgmode.org/manual/Setting-up-capture.html
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO %?\n %i\n %a")))

(setq org-agenda-files (list (concat org-directory "/notes.org")))
(setq org-agenda-files (list (concat org-directory "/todo.org")))
(setq org-agenda-files (list (concat org-directory "/long_term.org")))

;; http://orgmode.org/manual/Closing-items.html
(setq org-log-done 'time)
(setq org-log-done 'note)
;;
(setq org-startup-indented t)
(setq org-startup-folded "showall")

(setq org-startup-with-inline-images t)

(setq org-use-speed-commands t)

(setf org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

;; Org mode
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-agenda-span 'day)

(org-ac/config-default)

;; Treemacs fix
(with-eval-after-load 'org
    (defun org-switch-to-buffer-other-window (&rest args)
      "Same as the original, but lacking the wrapping call to `org-no-popups'"
      (apply 'switch-to-buffer-other-window args)))
