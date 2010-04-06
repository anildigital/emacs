; general
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key (kbd "A-F") 'ack)
(global-set-key "\C-xg" 'magit-status)

;; no printing!
;; no changing meta key!!
(when (boundp 'osx-key-mode-map)
  ;; Option is my meta key.
  (define-key osx-key-mode-map (kbd "A-;")
    '(lambda () (interactive) (message "noop")))
 
  ;; What's paper?
  (define-key osx-key-mode-map (kbd "A-p")
    '(lambda () (interactive) (message "noop"))))


; no mailing!
(global-unset-key (kbd "C-x m"))
(global-unset-key "\C-z")

; vim emulation
(global-set-key [C-tab] 'other-window)

; swap windows
(global-set-key (kbd "C-c s") 'swap-windows)

