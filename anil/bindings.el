                                        ; general
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key (kbd "A-F") 'ack)
(global-set-key "\C-xg" 'magit-status)
;; Go to line.
(global-set-key (kbd "M-g") 'goto-line)

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

                                        ; copy whole line
(global-set-key "\C-c\l" 'copy-line)

                                        ; swap windows
(global-set-key (kbd "C-c s") 'swap-windows)


;; So that Emacs never is quit by mistake.
(global-set-key (kbd "C-x C-c")
                (lambda ()
                  (interactive)
                  (if (y-or-n-p "Quit Emacs? ")
                      (save-buffers-kill-emacs))))

;; Fast go to .emacs.
(global-set-key (kbd "<f8>") (lambda ()
                                (interactive)
                                (find-file "~/.emacs.d/emacs.el")))


;; Increase and decrease font size.
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)