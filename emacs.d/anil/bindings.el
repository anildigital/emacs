;; general

(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-xp" 'anil-find-config)
(global-set-key "\M-i" 'insert-soft-tab)     


; no printing!
(define-key osx-key-mode-map (kbd "A-p")
  '(lambda () (interactive) (message "noop")))

; no mailing!
(global-unset-key (kbd "C-x m"))

;;duplicate line
(global-set-key [C-return] 'anil-duplicate-line)

(global-set-key [M-up] 'anil-inc-num-at-point)
(global-set-key [M-down] 'anil-dec-num-at-point)


; TODO: this doesn't work at all yet
;;(global-set-key "C-*" 'isearch-forward-at-point)

;; Open dot emacs
(global-set-key "\C-x." 'find-dot-emacs)

;; Ruby eval buffer
(global-set-key "\C-c\C-e" 'ruby-eval-buffer)


;; textmateness
(global-set-key [A-return] 'anil-insert-blank-line-after-current)
(global-set-key (kbd "A-M-]") 'align)
(global-set-key (kbd "A-]") 'indent-region)
(define-key osx-key-mode-map (kbd "A-t") 'fuzzy-find-in-project)
(define-key osx-key-mode-map (kbd "A-T") 'ido-goto-symbol)