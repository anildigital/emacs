(use-package
  org
  :mode (("\\.org\\'" . org-mode)
         ("\\.org_archive\\'" . org-mode)
         )
  :hook
  (after-init . org-agenda-list)
  (org-mode . (lambda () (display-line-numbers-mode 0)))
  (org-timer-done . anil-org-timer-hook)
  (org-clock-in . anil-on-org-clock-in)
  (org-clock-out . anil-on-org-clock-out)

  :bind
  ("C-c l s" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c a a" . org-agenda)
  ("<f16>" . org-agenda)
  ("C-c b" . org-switchb)
  ("C-c 9" . org-timer-set-timer)

  ;; org clock
  ("C-c I". anil/org-clock-in)
  ("C-c O" . org-clock-out)

  :init
  (setq org-directory "~/org")

  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (setq org-capture-templates '(("t" "Personal Todo" entry (file+headline "/Users/anil/org/todo.org"
                                                                          "Tasks") "* TODO %^{Description} %^g\n:LOGBOOK:\n- Added: %U\n:END:%?" )
                                ("c" "Coding Todo" entry (file+headline "/Users/anil/org/coding.org"
                                                                        "Tasks") "* TODO %?\n %i\n %a")
                                ("n" "Note" entry (file+headline "/Users/anil/org/notes.org"
                                                                 "Notes") "* %?\n")
                                ("m" "Meeting notes" entry (file+headline "/Users/anil/org/meeting_notes.org" "Meeting Notes")
                                 "* %^{Agenda}\n- Attendees: %^{Attendees}, Anil\n- Date: %U\n- Notes:\n  + %?\n- Action Items [/]\n   + [ ] "
                                 :prepend t)
                                ("r" "Reading list item" entry (file+headline "/Users/anil/org/toread.org" "Reading List")
                                 "* TODO %^{Description}\n  :LOGBOOK:\n  - Added: %U\n  :END:\n  %(current-kill 0)%?"
                                 :prepend t)
                                ))

  (setq org-agenda-files '("~/org"))

  (setq org-agenda-span 'day)

  (setq org-tag-alist '(("important" . ?i)
                        ("urgent"    . ?u)))

  (setq org-archive-location "archive/%s_archive::")

  (setq org-show-notification-handler 'message)

  (setq org-export-with-sub-superscripts nil)

  ;; http://orgmode.org/manual/Closing-items.html
  ;; (setq org-log-done 'time)
  ;; (setq org-log-done 'note)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "IN_PROGRESS(is)"  "HOLD(h)" "WAITING(w)" "NEEDSREVIEW(n)" "|" "DONE(d)" "CANCELED(c)")))

  (setq-default org-todo-keyword-faces
   '(("TODO" :foreground "#ffd166" :weight bold)
     ("IN_PROGRESS" :foreground "#ef476f" :weight bold)
     ("WAITING" :foreground "#118ab2" :weight bold)
     ("NEEDSREVIEW" :foreground "#b7b7a4" :weight bold)
     ("CANCELED" :foreground "#073b4c" :weight bold)
     ("DONE" :foreground "#06d6a0" :weight bold)))

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
  (with-eval-after-load 'org
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((sql . t))))
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)

  (set-face-attribute 'org-mode-line-clock nil :foreground "black" :weight 'bold :background "dark sea green")

  (require 'org-tempo)

  (defun anil-on-org-clock-in ()
    (shell-command "/Users/anil/.asdf/shims/hueadm light 1 turquoise bri=5"))

  (defun anil-on-org-clock-out ()
    (shell-command "/Users/anil/.asdf/shims/hueadm light 1 red bri=40"))

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
  :custom
  (org-roam-directory (file-truename "~/org"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-db-autosync-mode)
  )

(defun anil/org-id-update-org-roam-files ()
  "Update Org-ID locations for all Org-roam files."
  (interactive)
  (org-id-update-id-locations (org-roam--list-all-files)))

(defun anil/org-id-update-id-current-file ()
  "Scan the current buffer for Org-ID locations and update them."
  (interactive)
  (org-id-update-id-locations (list (buffer-file-name (current-buffer)))))

;; for org-roam-buffer-toggle
(add-to-list 'display-buffer-alist
             '(;; Left side window
               (".org-roam.*"
                (display-buffer-in-side-window)
                (window-width . 0.25)
                (side . left)
                (slot . 0))))

(use-package
  ox-pandoc
  :ensure t
  :commands org-export-dispatch
  )

(use-package
  org-mru-clock
  :ensure t
  :init
  (setq org-mru-clock-how-many 100
        org-mru-clock-completing-read #'ivy-completing-read)
  :bind* (("C-c C-x i" . org-mru-clock-in)
          ("C-c C-x C-j" . org-mru-clock-select-recent-task))
  :config
  (add-hook 'minibuffer-setup-hook #'org-mru-clock-embark-minibuffer-hook))

(use-package
  org-analyzer
  :ensure t
  )


(use-package org-fancy-priorities
  :diminish
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))
