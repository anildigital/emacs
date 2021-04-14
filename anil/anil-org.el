(use-package
  org
  :mode (("\\.org\\'" . org-mode)
         ("\\.org_archive\\'" . org-mode)
         )
  :hook (after-init . org-agenda-list)
  (org-mode . (lambda () (display-line-numbers-mode 0)))
  (org-timer-done . anil-org-timer-hook)

  :bind
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c a a" . org-agenda)
  ("<f16>" . org-agenda)
  ("C-c b" . org-switchb)

  ;; org clock
  ("C-c I". anil/org-clock-in)
  ("C-c O" . org-clock-out)

  :init
  ;; org-clock hooks for macOS app
  (setq org-directory "~/org")
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates '(("t" "Todo" entry (file+headline "/Users/anil/dropbox/org/todo.org"
                                                                 "Tasks") "* TODO %?\n %i\n %a")))
  (setq org-agenda-files (list (concat org-directory "/todo.org")
                               (concat org-directory "/long_term_todo.org")
                               (concat org-directory "/timesheet.org")
                               (concat org-directory "/habits.org")
                               ))
  (setq org-agenda-span 'day)

  (setq org-tag-alist '(("important" . ?i)
                        ("urgent"    . ?u)))

  (setq org-archive-location "archive/%s_archive::")

  (setq org-show-notification-handler 'message)

  ;; http://orgmode.org/manual/Closing-items.html
  ;; (setq org-log-done 'time)
  ;; (setq org-log-done 'note)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "IN_PROGRESS(is)"  "HOLD(h)" "WAITING(w)" "NEEDSREVIEW(n)" "|" "DONE(d)" "CANCELED(c)")))

  ;;
  (setq org-startup-indented t)
  (setq org-startup-with-inline-images t)
  (setq org-use-speed-commands t)
  (setf org-blank-before-new-entry '((heading . nil)
                                     (plain-list-item . nil)))

  ;; org-clock settings
  (setq org-clock-idle-time 15)

  ;; Save the running clock and all clock history when exiting Emacs, load it on startup
  (setq org-clock-persist t)
  ;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;; Do not prompt to resume an active clock, just resume it
  (setq org-clock-persist-query-resume nil)

  (setq org-clock-persist 'history)

  ;; Show lot of clocking history so it's easy to pick items off the `C-c I` list
  (setq org-clock-history-length 23)

  ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks
  ;; with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)

  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)

  ;; Enable auto clock resolution for finding open clocks
  (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))

  ;; Include current clocking task in clock reports
  (setq org-clock-report-include-clocking-task t)

  ;; use pretty things for the clocktable
  (setq org-pretty-entities t)

  ;; org-calendar settings
  (setq calendar-latitude 18.5)
  (setq calendar-longitude 73.8)
  (setq calendar-location-name "Pune, India")

  (setq org-agenda-custom-commands
        '(("1" "Q1" tags-todo "+important+urgent")
          ("2" "Q2" tags-todo "+important-urgent")
          ("3" "Q3" tags-todo "-important+urgent")
          ("4" "Q4" tags-todo "-important-urgent")))

  (setq org-refile-targets
        '((nil :maxlevel . 3)
          (org-agenda-files :maxlevel . 3)))
  :config
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)

  (set-face-attribute 'org-mode-line-clock nil :foreground "black" :weight 'bold :background "dark sea green")

  (require 'org-tempo)

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
  :after org
  :init (add-hook 'org-mode-hook (lambda ()
                                   (org-bullets-mode 1))))
(use-package
  org-roam
  :ensure t
  :after org
  :hook (after-init . org-roam-mode)
  :config (setq org-roam-directory "~/org/")
  (setq org-roam-index-file "~/org/index.org")
  (setq org-roam-capture-templates
        '(("d" "default" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "${dir}/%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: ${title}\n"
           :unnarrowed t)

          ("n" "note" plain (function org-roam--capture-get-point)
           "%?"
           :file-name "%<%Y%m%d%H%M%S>-${slug}"
           :head "#+title: ${title}\n"
           :unnarrowed t)
          ))

  :bind (:map org-roam-mode-map
              (("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph-show)
               ("C-c n j" . org-roam-jump-to-index)
               ("C-c n b" . org-roam-switch-to-buffer)
               ("C-c n g" . org-roam-graph-show))
              :map org-mode-map
              (("C-c n i" . org-roam-insert)
               ("C-c n l" . org-roam-buffer-toggle-display)
               ("C-c n I" . org-roam-insert-immediate))
              ))

(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 6969
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20)
  (org-roam-server-mode 1)
  )

(use-package
  ox-pandoc
  :ensure t
  :commands org-export-dispatch
  )

(use-package org-mru-clock
  :ensure t
  :init
  (setq org-mru-clock-how-many 100
        org-mru-clock-completing-read #'ivy-completing-read)
  :bind* (("C-c C-x i" . org-mru-clock-in)
          ("C-c C-x C-j" . org-mru-clock-select-recent-task))
  :config
  (add-hook 'minibuffer-setup-hook #'org-mru-clock-embark-minibuffer-hook))
