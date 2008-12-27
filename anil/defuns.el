(defun insert-soft-tab ()
  (interactive)
  (insert "  "))

; for loading libraries in from the vendor directory
(defun vendor (library)
  (let* ((file (symbol-name library))
         (normal (concat "~/elisp/vendor/" file))
         (suffix (concat normal ".el"))
         (anil (concat "~/elisp/anil/" file)))
    (cond
     ((file-directory-p normal) (add-to-list 'load-path normal) (require library))
     ((file-directory-p suffix) (add-to-list 'load-path suffix) (require library))
     ((file-exists-p suffix) (require library)))
    (when (file-exists-p (concat anil ".el"))
      (load anil))))


(defun ido-goto-symbol ()
    "Will update the imenu index and then use ido to select a symbol to navigate to"
    (interactive)
    (imenu--make-index-alist)
    (let ((name-and-pos '())
          (symbol-names '()))
      (flet ((addsymbols (symbol-list)
                         (when (listp symbol-list)
                           (dolist (symbol symbol-list)
                             (let ((name nil) (position nil))
                               (cond
                                ((and (listp symbol) (imenu--subalist-p symbol))
                                 (addsymbols symbol))
   
                                ((listp symbol)
                                 (setq name (car symbol))
                                 (setq position (cdr symbol)))
   
                                ((stringp symbol)
                                 (setq name symbol)
                                 (setq position (get-text-property 1 'org-imenu-marker symbol))))
   
                               (unless (or (null position) (null name))
                                 (add-to-list 'symbol-names name)
                                 (add-to-list 'name-and-pos (cons name position))))))))
        (addsymbols imenu--index-alist))
      (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
             (position (cdr (assoc selected-symbol name-and-pos))))
        (goto-char position))))


(defun anil-find-config ()
  (interactive)
  (let ((config-file
         (ido-completing-read "Config file: " (reject (directory-files "~/elisp/anil/")
                                                  (lambda (x) (string-match "^\\." x))))))
    (if (empty? config-file)
        (find-file "~/elisp/anil.el")
      (find-file (concat "~/elisp/anil/" config-file)))))

;; fix kill-word
(defun anil-kill-word (arg)
  "Special version of kill-word which swallows spaces separate from words"
  (interactive "p")
 
  (let ((whitespace-regexp "\\s-+"))
    (kill-region (point)
                 (cond
                  ((looking-at whitespace-regexp) (re-search-forward whitespace-regexp) (point))
                  ((looking-at "\n") (kill-line) (anil-kill-word arg))
                  (t (forward-word arg) (point))))))
 
(defun anil-backward-kill-word (arg)
  "Special version of backward-kill-word which swallows spaces separate from words"
  (interactive "p")
  (if (looking-back "\\s-+")
      (kill-region (point) (progn (re-search-backward "\\S-") (forward-char 1) (point)))
    (backward-kill-word arg))) 

(require 'thingatpt)
(defun anil-change-num-at-point (fn)
  (let* ((num (string-to-number (thing-at-point 'word)))
         (bounds (bounds-of-thing-at-point 'word)))
    (save-excursion
      (goto-char (car bounds))
      (anil-kill-word 1)
      (insert (number-to-string (funcall fn num 1))))))

; duplicate the current line
(defun anil-duplicate-line ()
  (interactive)
    (beginning-of-line)
    (copy-region-as-kill (point) (progn (end-of-line) (point)))
    (anil-insert-blank-line-after-current)
    (yank)
    (beginning-of-line))

(defun anil-inc-num-at-point ()
  (interactive)
  (anil-change-num-at-point '+))
 
(defun anil-dec-num-at-point ()
  (interactive)
  (anil-change-num-at-point '-))

(defun anil-insert-blank-line-after-current ()
  (interactive)
  (end-of-line)
  (newline-and-indent))

; set the mode based on the shebang;
; TODO: this sometimes breaks
(defun anil-shebang-to-mode ()
  (interactive)
  (let*
      ((bang (buffer-substring (point-min) (prog2 (end-of-line) (point) (move-beginning-of-line 1))))
       (mode (progn
               (string-match "^#!.+[ /]\\(\\w+\\)$" bang)
               (match-string 1 bang)))
       (mode-fn (intern (concat mode "-mode"))))
    (when (functionp mode-fn)
      (funcall mode-fn))))
;(add-hook 'find-file-hook 'anil-shebang-to-mode)


;; from http://platypope.org/blog/2007/8/5/a-compendium-of-awesomeness
;; I-search with initial contents
(defvar isearch-initial-string nil)

(defun isearch-set-initial-string ()
  (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
  (setq isearch-string isearch-initial-string)
  (isearch-search-and-update))

(defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
  "Interactive search forward for the symbol at point."
  (interactive "P\np")
  (if regexp-p (isearch-forward regexp-p no-recursive-edit)
    (let* ((end (progn (skip-syntax-forward "w_") (point)))
           (begin (progn (skip-syntax-backward "w_") (point))))
      (if (eq begin end)
          (isearch-forward regexp-p no-recursive-edit)
        (setq isearch-initial-string (buffer-substring begin end))
        (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (isearch-forward regexp-p no-recursive-edit)))))


(defun find-dot-emacs ()
  (interactive)
  (find-file "~/elisp/anil.el"))

;; evaluate current buffer
(defun ruby-eval-buffer () (interactive)
  "Evaluate the buffer with ruby."
  (shell-command-on-region (point-min) (point-max) "ruby"))


(defun gist-buffer-confirm ()
 (interactive)
  (when (yes-or-no-p "Are you sure you want to Gist this buffer? ") (gist-buffer)))

