;; save place in files between Sessions
(require 'saveplace)
(setq-default save-place t)

;;Emacs lisp mode for Cask files
(add-to-list 'auto-mode-alist '("\\.*Cask\\'" . emacs-lisp-mode))

;; Shell mode
(add-to-list 'auto-mode-alist '(".aliases" . sh-mode))
(add-to-list 'auto-mode-alist '(".bash_profile" . sh-mode))
(add-to-list 'auto-mode-alist '(".bashrc" . sh-mode))

;; Dockerfile mode
(add-to-list 'auto-mode-alist '("\\Dockerfile\\'" . dockerfile-mode))

;; Python mode
(add-to-list 'auto-mode-alist '("\\.py?\\'" . python-mode))

;; nov mode
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

;; Guru mode
(guru-global-mode +1)

;; diff-hl mode
(diff-hl-mode 1)
(diff-hl-dired-mode 1)
(diff-hl-flydiff-mode 1)
(diff-hl-margin-mode 1)
(diff-hl-amend-mode 1)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;;
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)

(require 'move-text)
(move-text-default-bindings)            ;

;; mutiple cursors
(require 'multiple-cursors)

(add-to-list 'auto-mode-alist '("\\.go?\\'" . go-mode))

;; less-mode
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

(add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode))

;; Remove trailng whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'subword-mode)

;; winner mode
(winner-mode 1)

;; avy
(require 'avy)

;; which key
(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-right)

;; On save remove trailing white space
(add-hook 'prog-mode-hook #'nuke_traling)

;; desktop-save mode
;; Automatically save and restore sessions
(desktop-save-mode 1)

;; browse-at-remote
(require 'browse-at-remote)

;; elisp-format
(require 'elisp-format)

;; Erlang mode
(add-to-list 'auto-mode-alist '("\\.*erl\\'" . erlang-mode))

;; ivy-mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; ripgrep
(require 'ripgrep)
(require 'projectile-ripgrep)

;;smart mode line
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq sml/theme 'dark)

;;dimmer
(require 'dimmer)
(dimmer-activate)
(setq dimmer-fraction 0.2)


;; desktop-mode
(add-hook 'auto-save-hook 'anil-desktop-save)

;;undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; volatile mode
(volatile-highlights-mode t)

(provide 'modes)
