; don't show startup message.
(setq inhibit-startup-message t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; don't create backup files
;(setq make-backup-files nil)
;(setq create-lockfiles nil)
;(setq auto-save-default nil)

; default tab width
(setq-default tab-width 2)

;; dired dwim target
(setq dired-dwim-target t)

;; default directory
(setq default-directory (concat (getenv "HOME") "/"))

; ask y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

; Enable paren mode
(show-paren-mode t)

;; highlight TODOs etc.
(add-hook 'find-file-hook (lambda() (highlight-phrase "\\(BUG\\|FIXME\\|TODO\\):")))

;; theme
(load-theme 'dracula t)

(global-hl-line-mode 1)
(global-linum-mode 0)

(add-hook 'writeroom-mode-hook #'git-gutter-mode 0)
(add-hook 'writeroom-mode-hook #'linum-mode 0)

(setq org-startup-with-inline-images t)

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

(provide 'preferences)
;;; preferences ends here
