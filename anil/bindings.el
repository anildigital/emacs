
;; bind to hippie-expand .. default is 'just-one-space'
(global-set-key "\M- " 'hippie-expand)
(global-set-key "\C-xg" 'magit-status)

;;smex
(global-set-key (kbd "M-x") 'smex) 
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ;;


(global-set-key [s-mouse-1] 'find-tag)


(global-set-key "\C-xp" 'anil-ido-find-project)
