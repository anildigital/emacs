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
  (interactive)
  "Convert lambda to stabby lambda"
  ;; (replace-regexp "lambda" "->" (match-string 1))
  (replace-regexp "lambda[\s]*{ *|\\([^|]*\\)|" "-> (\\1) {" (match-string 1))
  (replace-regexp "lambda[\s]*{" "-> {" (match-string 1))

  )
