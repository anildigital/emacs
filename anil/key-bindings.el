;; ;; bind to hippie-expand .. default is 'just-one-space'
(use-package
  hippie-exp
  :bind (("M-SPC" . hippie-expand)))


;; ;; ctags
(global-set-key [s-mouse-1] 'lsp-ui-peek-find-definitions)
(global-set-key [S-s-mouse-1] 'xref-pop-marker-stack)
(global-set-key (kbd "s-.") 'lsp-ui-peek-find-definitions)
(global-set-key "\M-*" 'pop-tag-mark)

;; Dired
(require 'dired)

(use-package
  dired
  :ensure nil
  :bind (("C-x C-d" . dired) :map dired-mode-map ("-" . 'dired-up-directory)))

;; kill current bufffer
(global-set-key (kbd "s-w") 'kill-buffer)
(global-set-key (kbd "C-^") 'kill-some-buffers)

;; Font size
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; ido
;; (global-set-key "\C-xp" 'anil-ido-find-project)

;; duplicate line
(global-set-key (kbd "s-d") 'anil-duplicate-current-line-or-region)

;; Command + Return to go to newline
(global-set-key (kbd "s-<backspace>") 'kill-whole-line)

;; New line and jump to it
(global-set-key (kbd "s-<return>") 'anil-new-line-jump-to-it)

(global-set-key [S-escape] 'delete-other-windows)
(global-set-key (kbd "s-[") 'other-window)
(global-set-key (kbd "s-]") 'other-window)

(global-set-key (kbd "C-w") 'backward-kill-word)

(global-set-key (kbd "C-c r") 'revert-buffer)

(global-set-key (kbd "C-c p") 'anil-add-elixir-pipe)

(global-set-key (kbd "C-c l l") #'dictionary-lookup-definition)

(global-set-key (kbd "C-c g") 'google-search)

(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key (kbd "C-c C-f") 'copy-file-name-to-clipboard)


(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


(define-key global-map [home] 'beginning-of-line)
(define-key global-map [end] 'end-of-line)

;; full screen
(global-set-key (kbd "C-s-f") 'toggle-frame-fullscreen)

;;org-projectile

(global-set-key (kbd "s-=") 'text-scale-increase)
(global-set-key (kbd "s--") 'text-scale-decrease)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-S") 'counsel-ag)
(global-set-key (kbd "C-=") 'anil-treesit-expand-region)


;; Add pound
(when (eq system-type 'darwin)
  (fset 'insert-pound "#")
  (define-key global-map "\M-3" #'insert-pound))

(global-set-key "\C-cP" 'anil-goto-config)
(global-set-key (kbd "\C-ct") 'anil-goto-todo)
(global-set-key (kbd "\C-cy") 'anil-goto-coding-todo)
(global-set-key (kbd "\C-c l t") 'anil-goto-long-term-todo)
(global-set-key (kbd "\C-c n o") 'anil-goto-index)

;; contextual backspace
(global-set-key (kbd "C-<backspace>") 'contextual-backspace)

;;set shell file name (grep doesn't work fine with fish-shell)
(setq shell-file-name "/bin/sh")

;; go to previous buffer
(global-set-key (kbd "s-i") #'anil-switch-to-previous-buffer)

;; open shell
(global-set-key (kbd "C-~") #'anil-goto-shell)

;; anzu
(global-set-key [remap query-replace] 'anzu-query-replace)
(global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)

;; zop-to-char
(global-set-key [remap zap-to-char] 'zop-to-char)
