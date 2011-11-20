; don't show startup message.
(setq inhibit-startup-message t)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

; don't create backup files 
(setq make-backup-files nil)

;; Set emacs cursor type
(setq-default cursor-type 'bar) 

; default tab width
(setq-default tab-width 2)

; ask y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

; Enable paren mode
(show-paren-mode t)

;; Set favorite font
(setq anil-fav-font "-apple-inconsolata-medium-r-normal-*-16-*-*-*-m-0-iso10646-1")
(set-frame-font anil-fav-font)

(add-to-list 'default-frame-alist (cons 'font anil-fav-font))
(add-to-list 'initial-frame-alist (cons 'font anil-fav-font))


