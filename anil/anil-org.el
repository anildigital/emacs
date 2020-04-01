(use-package
  org
  :mode (("\\.org\\'" . org-mode))
  :hook ((org-clock-in-hook . (lambda()
                                (call-process "/usr/bin/osascript" nil 0 nil "-e" (concat
                                                                                   "tell application \"org-clock-statusbar\" to clock in \""
                                                                                   (replace-regexp-in-string
                                                                                    "\"" "\\\\\""
                                                                                    org-clock-current-task)
                                                                                   "\""))))
         (org-clock-out-hook . (lambda()
                                 (call-process "/usr/bin/osascript" nil 0 nil "-e"
                                               "tell application \"org-clock-statusbar\" to clock out")))
         (after-init-hook . org-agenda-list))
  :init
  ;; org-clock hooks for macOS app
  (setq org-directory "~/org")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
                                 "* TODO %?\n %i\n %a")))
  (setq org-agenda-files (list (concat org-directory "/notes.org")))
  (setq org-agenda-files (list (concat org-directory "/todo.org")))
  (setq org-agenda-files (list (concat org-directory "/long_term.org")))
  (setq org-agenda-span 'day)

  ;; http://orgmode.org/manual/Closing-items.html
  (setq org-log-done 'time)
  (setq org-log-done 'note)
  ;;
  (setq org-startup-indented t)
  (setq org-startup-with-inline-images t)
  (setq org-use-speed-commands t)
  (setf org-blank-before-new-entry '((heading . nil)
                                     (plain-list-item . nil)))
  (setq org-clock-idle-time 2)
  (setq org-clock-persist t)
  (setq org-clock-persist 'history)
  :config
  (org-clock-persistence-insinuate)

  ;; Treemacs fix
  (with-eval-after-load 'org
    (defun org-switch-to-buffer-other-window
        (&rest
         args)
      "Same as the original, but lacking the wrapping call to `org-no-popups'"
      (apply 'switch-to-buffer-other-window args))))

(use-package
  org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook (lambda ()
                                   (org-bullets-mode 1))))
