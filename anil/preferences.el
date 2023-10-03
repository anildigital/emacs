;; don't show startup message.
(setq inhibit-startup-message t)

(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))

(setq max-lisp-eval-depth 10000)

;; default tab width
(setq-default tab-width 2)
(setq tab-always-indent 'complete)

;; dired dwim target
(setq dired-dwim-target t)

;; default directory
(setq default-directory (concat (getenv "HOME") "/"))

;; ls dired settings
(when (string= system-type "darwin")
  (setq dired-use-ls-dired nil))

;; ask y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Enable paren mode
(show-paren-mode t)

;; Global linum mode
(global-display-line-numbers-mode)

;; highlight TODOs etc.
(add-hook 'find-file-hook (lambda()
                            (highlight-phrase "\\(BUG\\|FIXME\\|TODO\\):")))

;; Auto save visited mode
(auto-save-visited-mode)

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-diff-options "-w")

;; query replace regex
(defalias 'qrr 'query-replace-regexp)


;; no tabs
(setq-default indent-tabs-mode nil)

(defalias 'list-buffers 'ibuffer)

;; Disable Emacs going to sleep
(global-unset-key [(control z)])

(delete-selection-mode 1)

;;(setq visible-bell t)
(setq ring-bell-function 'ignore)

(setq x-stretch-cursor t)

(setq-default cursor-type 'bar)

;(setq company-show-numbers t)


(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; delete old buffers
(setq clean-buffer-list-delay-general 1)
(midnight-delay-set 'midnight-delay "02:00am")

(add-hook 'prog-mode-hook
                (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(setq warning-minimum-level :error)

;; opening large file
(setq large-file-warning-threshold 100000000)

;; smooth scrolling
(pixel-scroll-mode 1)
(setq scroll-preserve-screen-position 1)
(setq scroll-conservatively 101)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; To remove gaps between your emacs frames and other windows
(setq frame-resize-pixelwise t)

;; auth sources
(setq auth-sources '("~/.authinfo.gpg"))

;; save place mode
(save-place-mode)

;; global auto revert mode
(global-auto-revert-mode 1)

;; use fish shell from shell
(setq-default explicit-shell-file-name "/opt/homebrew/bin/fish")

;; time
(display-time-mode 1)

(setq require-final-newline t)

