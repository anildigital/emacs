(require 'dired)

;; bind to hippie-expand .. default is 'just-one-space'
(global-set-key "\M- " 'hippie-expand)
(global-set-key "\C-xg" 'magit-status)

;; ctags
(global-set-key [s-mouse-1] 'find-tag)
(global-set-key (kbd "s-.") 'find-tag)

;; Dired
; - is `cd ..` (like vim)
(define-key dired-mode-map "-" 'dired-up-directory)
; prefer dired over dumping dir list to buffer
(global-set-key "\C-x\C-d" 'dired)


;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)


(global-set-key "\C-xp" 'anil-ido-find-project)

;; Command + Return to go to newline
(global-set-key [s-return] 'textmate-next-line)

(global-set-key [S-escape] 'delete-other-windows)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(global-set-key "\C-c \C-l" 'stabby-lambda)

(define-key global-map (kbd "C-c j") 'ace-jump-mode)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)


(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'goto-chg)
(global-set-key [(control ?.)] 'goto-last-change)
(global-set-key [(control ?,)] 'goto-last-change-reverse)


(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)


(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)


(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; neotree toggle
(global-set-key (kbd "s-\\") 'neotree-toggle)

;; helm M-x
(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'key-bindings)
;;; key-bindings.el ends here
