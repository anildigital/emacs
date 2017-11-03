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

;; Scala mode
(add-to-list 'auto-mode-alist '("\\.scala?\\'" . scala-mode))

;; Guru mode
(guru-global-mode +1)

;; Git Gutter
(global-git-gutter-mode +1)

;;
(autoload 'ace-jump-mode "ace-jump-mode" "Emacs quick move minor mode" t)

(require 'move-text)
(move-text-default-bindings)            ;

;; mutiple cursors
(require 'multiple-cursors)


(add-to-list 'auto-mode-alist '(".go" . go-mode)) ;

;; less-mode
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

;; nyan-cat
(nyan-mode 1)

(add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode))

;; Remove trailng whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; winner mode
(winner-mode 1)

;; avy
(require 'avy)

;; which key
(require 'which-key)
(which-key-mode)

;; undo tree
(global-undo-tree-mode)
(global-set-key (kbd "C-M-_") 'undo-tree-visualize)

;; desktop-save mode
(desktop-save-mode 1)

;; browse-at-remote
(require 'browse-at-remote)

;; elisp-format
(require 'elisp-format)

;; ivy-mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; swiper
(setq ivy-use-virtual-buffers t)

(provide 'modes)
