(use-package
  org
  :mode (("\\.org\\'" . org-mode))
  :hook ((after-init-hook . org-agenda-list))
  :init
  ;; org-clock hooks for macOS app
  (setq org-directory "~/org")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates '(("t" "Todo" entry (file+headline "/Users/anil/dropbox/org/todo.org"
                                                                 "Tasks") "* TODO %?\n %i\n %a")))
  (setq org-agenda-files (list (concat org-directory "/todo.org")
                               (concat org-directory "/long_term.org")))
  (setq org-agenda-span 'day)

  (setq org-tag-alist '(("important" . ?i)
                    ("urgent"    . ?u)))

  ;; http://orgmode.org/manual/Closing-items.html
  (setq org-log-done 'time)
  (setq org-log-done 'note)

  ;;
  (setq org-startup-indented t)
  (setq org-startup-with-inline-images t)
  (setq org-use-speed-commands t)
  (setf org-blank-before-new-entry '((heading . nil)
                                     (plain-list-item . nil)))
  (setq org-clock-idle-time 3)
  (setq org-clock-persist t)
  (setq org-clock-persist 'history)
  :config (org-clock-persistence-insinuate)

  (setq org-agenda-custom-commands
        '(("1" "Q1" tags-todo "+important+urgent")
          ("2" "Q2" tags-todo "+important-urgent")
          ("3" "Q3" tags-todo "-important+urgent")
          ("4" "Q4" tags-todo "-important-urgent")))

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

(use-package
  org-roam
  :ensure t
  :hook (after-init . org-roam-mode)
  :config (setq org-roam-directory "~/org/")
  (setq org-roam-index-file "~/org/index.org")
  (add-hook 'org-clock-in-hook (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e" (concat "tell application \"org-clock-statusbar\" to clock in \"" (replace-regexp-in-string "\"" "\\\\\"" org-clock-current-task) "\""))))
  (add-hook 'org-clock-out-hook (lambda () (call-process "/usr/bin/osascript" nil 0 nil "-e" "tell application \"org-clock-statusbar\" to clock out")))
  :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph-show)
               ("C-c n j" . org-roam-jump-to-index)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph-show))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))
