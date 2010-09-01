(font-lock-mode t)
(setq standard-indent 2)

;; Set line number mode true
(setq linum-mode t)

;; Set column number mode
(setq column-number-mode t)

;; line number mode
(setq line-number-mode t)

;; show paren mode
(show-paren-mode t)

;; Setting up line number mode
(add-hook 'find-file-hook (lambda () (linum-mode 1)))

;; Confirm before closing emacs
(setq confirm-kill-emacs 'yes-or-no-p)

;; Turn off the annoying default backup behaviour=
(if (file-directory-p "~/.emacs.d/backup")
    (setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
  (message "Directory does not exist: ~/.emacs.d/backup"))

;; display more info
(defalias 'ap 'apropos)
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'qrr 'query-replace-regex)
(defalias 'qr 'query-replace)

(set-default 'indicate-empty-lines t)

;; follow symlinks
(setq vc-follow-symlinks -1)

;; use clipboard
(setq x-select-enable-clipboard t)

;; display time
(display-time)

;; Set default browser as Google Chrome
(setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "google-chrome")