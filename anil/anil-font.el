;;; Code:
;; Set favorite font
(when (not (window-system))
  (setq anil-fav-font "-*-Source Code Pro-normal-normal-normal-*-13-*-*-*-m-0-iso10646-1")
  (set-frame-font anil-fav-font)
  (add-to-list 'default-frame-alist (cons 'font anil-fav-font))
  (add-to-list 'initial-frame-alist (cons 'font anil-fav-font))
  )

(when (window-system)
  (setq anil-fav-font "Fira Code")
  (set-frame-font anil-fav-font)
  (mac-auto-operator-composition-mode)
  (add-to-list 'default-frame-alist (cons 'font anil-fav-font))
  (add-to-list 'initial-frame-alist (cons 'font anil-fav-font)))
