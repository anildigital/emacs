; don't show startup message.
(setq inhibit-startup-message t)

(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

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

;; Global linum mode
(global-display-line-numbers-mode)

;; highlight TODOs etc.
(add-hook 'find-file-hook (lambda() (highlight-phrase "\\(BUG\\|FIXME\\|TODO\\):")))

;; Auto save visited mode
(auto-save-visited-mode)

;; theme
(load-theme 'dracula t)
(unless (display-graphic-p)
  (load-theme 'wombat))

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

(setq company-show-numbers t)


(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq desktop-path '(".config/emacs"))
(setq desktop-dirname ".config/emacs")
(setq desktop-base-file-name "emacs-desktop")


(custom-theme-set-faces
 'dracula
 '(flyspell-duplicate ((t (:weight bold :underline (:color "#0044ff" :style wave)))))
 '(flyspell-incorrect ((t (:weight bold :underline (:color "#00ff77" :style wave))))))

;; super save
(super-save-mode +1)
;; add integration with ace-window
(add-to-list 'super-save-triggers 'ace-window)
;; save on find-file
(add-to-list 'super-save-hook-triggers 'counsel-find-file)

(provide 'preferences)
;;; preferences ends here
