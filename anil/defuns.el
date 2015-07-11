;; Find recent files
(defun anil-recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun anil-ido-find-project ()
  (interactive)
  (find-file
   (concat "~/Projects/" (ido-completing-read "Project: "
                                              (directory-files "~/Projects/" nil "^[^.]")))))

(defun open-gitx ()
	(interactive)
	(shell-command "/usr/local/bin/gitx ."))


(defun anil-clean-slate ()
  "Kills all buffers except *scratch*"
  (interactive)
  (let ((buffers (buffer-list)) (safe '("*scratch*")))
    (while buffers
      (when (not (member (car buffers) safe))
        (kill-buffer (car buffers))
        (setq buffers (cdr buffers))))))


(defun stabby-lambda()
  "Convert lambda to stabby lambda"
  (interactive)
  ;; (replace-regexp "lambda" "->" (match-string 1))
  (replace-regexp "lambda[\s]*{ *|\\([^|]*\\)|" "-> (\\1) {" (match-string 1))
  (replace-regexp "lambda[\s]*{" "-> {" (match-string 1))

  )

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t))))
  (message "Refreshed open files."))


;; Function to launch a google search
(defun google-search ()
  "googles a query or a selected region"
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Google: ")))))


(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))
