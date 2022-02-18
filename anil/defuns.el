;; find recent files
(defun anil-ido-find-project ()
  (interactive)
  (find-file (concat "~/Projects/" (ido-completing-read "Project: " (directory-files "~/Projects/"
                                                                                     nil "^[^.]")))))

(defun anil-duplicate-line ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(defun anil-new-line-jump-to-it ()
  (interactive)
  (move-end-of-line 1)
  (electric-newline-and-maybe-indent))

(defun anil-clean-slate ()
  "Kills all buffers except *scratch*"
  (interactive)
  (let ((buffers (buffer-list))
        (safe '("*scratch*")))
    (while buffers (when (not (member (car buffers) safe))
                     (kill-buffer (car buffers))
                     (setq buffers (cdr buffers))))))

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf (when (and (buffer-file-name)
                                        (not (buffer-modified-p)))
                               (revert-buffer t t t))))
  (message "Refreshed open files."))


;; Function to launch a google search
(defun google-search ()
  "googles a query or a selected region"
  (interactive)
  (browse-url (concat "http://www.google.com/search?q=" (if mark-active
                                                            (buffer-substring
                                                             (region-beginning)
                                                             (region-end))
                                                          (read-string "Google: ")))))
(defun anil-goto-last-change ()
  (interactive)
  (call-interactively 'goto-last-change)
  (call-interactively 'recenter-top-bottom)
  )


(defun anil-goto-config ()
  (interactive)
  (find-file "~/.config/emacs/init.el"))

(defun anil-goto-todo ()
  (interactive)
  (find-file "~/org/todo.org"))

(defun anil-goto-index ()
  (interactive)
  (find-file "~/org/index.org"))

(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)
    (recenter-top-bottom)
    (recenter-top-bottom)))

(defun eshell/x ()
  (insert "exit")
  (eshell-send-input)
  (delete-window))

(defun contextual-backspace ()
  "Hungry whitespace or delete word depending on context."
  (interactive)
  (if (looking-back "[[:space:]\n]\\{2,\\}" (- (point) 2))
      (while (looking-back "[[:space:]\n]" (- (point) 1))
        (delete-char -1))
    (cond ((and
            (boundp 'smartparens-strict-mode)
            smartparens-strict-mode)
           (sp-backward-kill-word 1))
          ((and
            (boundp 'subword-mode)
            subword-mode)
           (subword-backward-kill 1))
          (t (backward-kill-word 1)))))


;; from http://ergoemacs.org/emacs/blog.html
(defun open-in-textedit ()
  "Open the current file or `dired' marked files in Mac's TextEdit.
This command is for Mac only.

Version 2017-11-02"
  (interactive)
  (let* (($file-list (if (string-equal major-mode "dired-mode")
                         (dired-get-marked-files)
                       (list (buffer-file-name))))
         ($do-it-p (if (<= (length $file-list) 5) t (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p (cond ((string-equal system-type "darwin")
                          (mapc (lambda ($fpath)
                                  (shell-command (format "open -a /Applications/TextEdit.app \"%s\""
                                                         $fpath))) $file-list))))))


(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode) default-directory (buffer-file-name))))
    (when filename (kill-new filename)
          (message "Copied buffer file name '%s' to the clipboard." filename))))


(defun anil/org-narrow-forward ()
  "Move to the next subtree at same level, and narrow to it."
  (interactive)
  (widen)
  (org-forward-heading-same-level 1)
  (org-narrow-to-subtree))

(defun anil/org-narrow-backward ()
  "Move to the next subtree at same level, and narrow to it."
  (interactive)
  (widen)
  (org-backward-heading-same-level 1)
  (org-narrow-to-subtree))

(defun anil-prog-nuke-trailing-whitespace ()
  (when (derived-mode-p 'prog-mode)
    (delete-trailing-whitespace)))

(defun anil-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))


(defun anil-treemacs-swiper ()
  (interactive)
  (treemacs-select-window)
  (swiper))

(defun anil-org-log-delete ()
  "Delete logbook drawer of subtree."
  (interactive)
  (save-excursion (goto-char (org-log-beginning))
                  (when (save-excursion (save-match-data (beginning-of-line 0)
                                                         (search-forward-regexp org-drawer-regexp)
                                                         (goto-char (match-beginning 1))
                                                         (looking-at "LOGBOOK")))
                    (org-mark-element)
                    (delete-region (region-beginning)
                                   (region-end))
                    (org-remove-empty-drawer-at (point)))))


(defun anil/org-clock-in ()
  (interactive)
  (org-clock-in '(4)))


(defun anil-pulse-line
    (&rest
     _)
  "Pulse the current line."
  (pulse-momentary-highlight-one-line (point)))
(dolist (command '(recenter-top-bottom other-window ace-window anil-scroll-down-half
                                       anil-scroll-up-half))
  (advice-add command
              :after #'anil-pulse-line))

(defun anil-org-timer-hook ()
  (call-process "/usr/bin/say" "" t "" "" "Time up!"))

(provide 'defuns)
