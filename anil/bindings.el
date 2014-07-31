
;; bind to hippie-expand .. default is 'just-one-space'
(global-set-key "\M- " 'hippie-expand)
(global-set-key "\C-xg" 'magit-status)

;;smex
(global-set-key (kbd "M-x") 'smex) 
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ;;


(global-set-key [s-mouse-1] 'find-tag)


(global-set-key "\C-xp" 'anil-ido-find-project)

;;
(global-set-key  (kbd "M-n") 'open-gitx)

;; Run ruby buffer
(global-set-key (kbd "s-r") 'ruby-compilation-this-buffer)

;; Search
(global-set-key (kbd "s-F") 'rgrep)


;; Command + Return to go to newline
(global-set-key [s-return] 'textmate-next-line)



(global-set-key [S-escape] 'delete-other-windows)
