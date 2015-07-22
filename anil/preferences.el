; don't show startup message.
(setq inhibit-startup-message t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; Fix Emacs scrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

; don't create backup files
(setq make-backup-files nil)
(setq create-lockfiles nil)
(setq auto-save-default nil)

; default tab width
(setq-default tab-width 2)

;; default directory
(setq default-directory (concat (getenv "HOME") "/"))

; ask y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

; Enable paren mode
(show-paren-mode t)
;; (require 'smartparens-config)
;; (smartparens-global-mode 1)
;; (show-smartparens-global-mode +1)


(setq mac-shift-modifier 'meta);


;; Set favorite font
(setq anil-fav-font "-apple-inconsolata-medium-r-normal-*-16-*-*-*-m-0-iso10646-1")
(set-frame-font anil-fav-font)

(add-to-list 'default-frame-alist (cons 'font anil-fav-font))
(add-to-list 'initial-frame-alist (cons 'font anil-fav-font))

;; highlight TODOs etc.
(add-hook 'find-file-hook (lambda() (highlight-phrase "\\(BUG\\|FIXME\\|TODO\\):")))


;; theme
(load-theme 'zenburn t)
(global-hl-line-mode 1)

(global-linum-mode 1)

(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

;; Visual bell
(setq visible-bell t)

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-diff-options "-w")

;; query replace regex
(defalias 'qrr 'query-replace-regexp)

;;(setq-default indent-tabs-mode nil)
(defalias 'list-buffers 'ibuffer)

(global-git-gutter-mode +1)

(provide 'preferences)
;;; preferences ends here
