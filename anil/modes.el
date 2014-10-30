;; save place in files between Sessions
(require 'saveplace)
(setq-default save-place t)

;; uniquify buffer names.
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers


;; enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Magit is an interface to Git for Emacs
(require 'magit)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))
(custom-set-faces
 '(diff-added ((t (:foreground "green3"))) 'now)
 '(diff-removed ((t (:foreground "red3"))) 'now)
 )


;; markdown mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '(".text" . markdown-mode))
(add-to-list 'auto-mode-alist '(".markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '(".md" . markdown-mode))

(setq markdown-command "/usr/local/bin/markdown")


;; smex
(require 'smex)
(smex-initialize)


;; Shell mode
(add-to-list 'auto-mode-alist '(".aliases" . sh-mode))
(add-to-list 'auto-mode-alist '(".bash_profile" . sh-mode))
(add-to-list 'auto-mode-alist '(".bashrc" . sh-mode))


;; js-mode hook
(add-hook 'js2-mode-hook
          '(lambda ()
             (add-hook 'before-save-hook
                       (lambda ()
                         (untabify (point-min) (point-max))))))

;; js-mode2
(add-to-list 'auto-mode-alist '(".js" . js2-mode))


;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Gitx
(load-file "~/.emacs.d/vendor/gitx.el")


(add-to-list 'load-path "~/.emacs.d/vendor/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-wrap-history t)


;; webmode
;;(load-file "~/.emacs.d/vendor/web-mode.el")

;; exec path from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  )
(add-hook 'web-mode-hook  'web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; emmet
(require 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
(add-hook 'web-mode-hook  'emmet-mode) 



;; Clojure mode hook
(add-hook 'clojure-mode-hook 'paredit-mode)

;; Dockerfile mode
(add-to-list 'auto-mode-alist '("\\Dockerfile\\'" . dockerfile-mode))

;; Python mode
(add-to-list 'auto-mode-alist '("\\.py?\\'" . python-mode))

;;
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; scala-mode-2
(add-hook 'scala-mode-hook '(lambda ()
  (require 'whitespace)
  (make-local-variable 'before-save-hook)
  (add-hook 'before-save-hook 'whitespace-cleanup)
  (whitespace-mode)

  (local-set-key (kbd "C-x '") 'sbt-run-previous-command)
   
  (local-set-key (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
))


;; Projectile mode
(projectile-global-mode)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; recentf mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;; Guru mode
;;(guru-global-mode +1)


;; Company mode
(add-hook 'after-init-hook 'global-company-mode)


;;
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)


(add-hook 'after-init-hook #'global-flycheck-mode)


(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(require 'move-text)
(move-text-default-bindings);

;; mutiple cursors
(require 'multiple-cursors)



;; Load merlin-mode
(require 'merlin)

;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)

;; Enable auto-complete
(setq merlin-use-auto-complete-mode 'easy)

;; Use opam switch to lookup ocamlmerlin binary
(setq merlin-command 'opam)
