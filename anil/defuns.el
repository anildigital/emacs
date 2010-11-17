; for loading libraries in from the vendor directory
(defun vendor (library)
  (let* ((file (symbol-name library))
         (normal (concat "~/.emacs.d/vendor/" file))
         (suffix (concat normal ".el"))
         (anil (concat "~/.emacs.d/anil/" file)))
    (cond
     ((file-directory-p normal) (add-to-list 'load-path normal) (require library))
     ((file-directory-p suffix) (add-to-list 'load-path suffix) (require library))
     ((file-exists-p suffix) (require library)))
    (when (file-exists-p (concat anil ".el"))
      (load anil))))

;; find project
(defun anil-ido-find-project ()
  (interactive)
  (find-file
   (concat "~/Code/" (ido-completing-read "projects: "
                           (directory-files "~/Code/" nil "^[^.]")))))

; copy line
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

; view url
(require 'thingatpt)
(defun view-url ()
  "Open a new buffer containing the contents of URL."
  (interactive)
  (let* ((default (thing-at-point-url-at-point))
         (url (read-from-minibuffer "URL: " default)))
    (switch-to-buffer (url-retrieve-synchronously url))
    (rename-buffer url t)
    ;; TODO: switch to nxml/nxhtml mode
    (cond ((search-forward "<?xml" nil t) (xml-mode))
          ((search-forward "<html" nil t) (html-mode)))))


; sudo edit
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(defun nuke-all-buffers ()
  "Kill all buffers, leaving *scratch* only."
  (interactive)
  (mapcar (lambda (x) (kill-buffer x)) (buffer-list)) (delete-other-windows))


(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((/= (count-windows) 2)
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1))))
  (other-window 1))

;; Google
(defun google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if mark-active
        (buffer-substring (region-beginning) (region-end))
      (read-string "Query: ")))))



; for finding integers
(defun integer-bounds-of-integer-at-point ()
  "Return the start and end points of an integer at the current point.
The result is a paired list of character positions for an integer
located at the current point in the current buffer.  An integer is any
decimal digit 0 through 9 with an optional starting minus symbol
\(\"-\")."
  (if (looking-at "-?[0-9]+")
      (let ((end (match-end 0))
            (start
             (save-excursion
               (re-search-backward "[^0-9]")
               (if (looking-at "-")
                   (point) ;; Use current point if a "-".
                 (+ 1 (point)))))) ;; Add 1 to correct extra step
        ;; backwards.
        (cons start end))
    nil))

(put 'integer
     'bounds-of-thing-at-point
     'integer-bounds-of-integer-at-point)

(autoload 'integer-bounds-of-integer-at-point "integers"
    "Return the start and end points of an integer at the current point.")

(defun browse-rails-ticket-at-point ()
  "Visit ticket at point."
  (interactive)
  (let ((ticket (thing-at-point 'word)))
    (if ticket
        (browse-url (concat "https://rails.lighthouseapp.com/projects/8994/tickets/" ticket))
      (error "No ticket at point"))))