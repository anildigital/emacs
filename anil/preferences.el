; don't show startup message.
(setq inhibit-startup-message t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; don't create backup files
;;(setq make-backup-files nil)
;;(setq create-lockfiles nil)
;;(setq auto-save-default nil)
(setq backup-directory-alist `(("." . "~/.saves")))

; default tab width
(setq-default tab-width 2)
(setq tab-always-indent 'complete)

;; dired dwim target
(setq dired-dwim-target t)

;; default directory
(setq default-directory (concat (getenv "HOME") "/"))

;; ls dired settings
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

; ask y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

; Enable paren mode
(show-paren-mode t)

;; highlight TODOs etc.
(add-hook 'find-file-hook (lambda() (highlight-phrase "\\(BUG\\|FIXME\\|TODO\\):")))

;; theme
(load-theme 'dracula t)
(unless (display-graphic-p)
  (load-theme 'wheatgrass))

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-diff-options "-w")

;; query replace regex
(defalias 'qrr 'query-replace-regexp)

;;(setq-default indent-tabs-mode nil)
(defalias 'list-buffers 'ibuffer)

;; Disable Emacs going to sleep
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

(delete-selection-mode 1)

;;(setq visible-bell t)
(setq ring-bell-function 'ignore)

(setq x-stretch-cursor t)

(provide 'preferences)
;;; preferences ends here
