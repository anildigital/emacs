;;; Code:
;; Set favorite font
;(setq anil-fav-font "-*-Source Code Pro-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
(setq anil-fav-font "-*-Inconsolata-normal-normal-normal-*-16-*-*-*-m-0-iso10646-1")
(set-frame-font anil-fav-font)

(add-to-list 'default-frame-alist (cons 'font anil-fav-font))
(add-to-list 'initial-frame-alist (cons 'font anil-fav-font))
