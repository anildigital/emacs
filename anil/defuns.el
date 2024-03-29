;; find recent files
(defun anil-ido-find-project ()
  (interactive)
  (find-file (concat "~/Projects/" (ido-completing-read "Project: " (directory-files "~/Projects/"
                                                                                     nil "^[^.]")))))
(defun anil-duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
        (exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
        (exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
      (dotimes (i arg)
        (goto-char end)
        (newline)
        (insert region)
        (setq end (point)))
      (goto-char (+ origin (* (length region) arg) arg)))))

(defun anil-new-line-jump-to-it ()
  (interactive)
  (move-end-of-line 1)
  (electric-newline-and-maybe-indent))


(defun anil-add-elixir-pipe ()
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent)
  (insert "|> ")
  )

(defun anil-align-to-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) "=") 1 1 ))

(defun anil-align-to-colon (begin end)
  "Align region to colon"
  (interactive "r")
  (align-regexp begin end
                (rx ":" (group (zero-or-more (syntax whitespace))) ) 1 1 ))

(defun anil-align-to-comma (begin end)
  "Align region to comma  signs"
  (interactive "r")
  (align-regexp begin end
                (rx "," (group (zero-or-more (syntax whitespace))) ) 1 1 ))


(defun anil-align-to-hash (begin end)
  "Align region to hash ( => ) signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) "=>") 1 1 ))

;; work with this
(defun anil-align-to-comma-before (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) ",") 1 1 ))

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

(defun anil-copy-line (N)
  (interactive "P")
  (save-excursion (goto-line N)
                  (kill-new (buffer-substring (point-at-bol) (point-at-eol)))
                  ))

(defun anil-goto-config ()
  (interactive)
  (find-file "~/.config/emacs/init.el"))

(defun anil-goto-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun anil-goto-shell ()
  (interactive)
   (call-interactively #'vterm))

(defun anil-goto-todo ()
  (interactive)
  (find-file "~/org/todo.org"))

(defun anil-goto-coding-todo ()
  (interactive)
  (find-file "~/org/coding.org"))

(defun anil-goto-long-term-todo ()
  (interactive)
  (find-file "~/org/long_term_todo.org"))


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
  (call-process "/usr/bin/say" "" t "" "" "Pomodoro Time up!"))



(defvar anil-treesit-expand-region-node nil)

;;;###autoload
(defun anil-treesit-expand-region ()
  (interactive)
  (unless (and anil-treesit-expand-region-node
               (use-region-p)
               (eq (treesit-node-start anil-treesit-expand-region-node)
                   (region-beginning))
               (eq (treesit-node-end anil-treesit-expand-region-node)
                   (region-end)))
    (setq anil-treesit-expand-region-node nil))
  (let* ((node (if anil-treesit-expand-region-node
                   (treesit-node-parent anil-treesit-expand-region-node)
                 (treesit-node-at (point))))
         (start (treesit-node-start node)))
    (when (use-region-p)
      (deactivate-mark))
    (goto-char start)
    (activate-mark)
    (goto-char (treesit-node-end node))
    (push-mark)
    (goto-char start)
    (setq anil-treesit-expand-region-node node)))


(defalias 'singlyfy
  (kmacro "C-s d o <return> C-b C-b C-b , C-e : C-s e n d <return> <backspace> <backspace> <backspace> C-p M-^ SPC C-e s-s"))

(defun anil/show-agenda ()
  (let ((agenda-frame (make-frame-command)))
    (select-frame agenda-frame)
    (org-agenda-list)
    (x-focus-frame agenda-frame)))

(provide 'defuns)
