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
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; Magit is an interface to Git for Emacs
(require 'magit)
(custom-set-faces
  '(diff-added ((t (:foreground "green3"))) 'now)
  '(diff-removed ((t (:foreground "red3"))) 'now)
  );


;; markdown mode
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '(".text" . markdown-mode))
(add-to-list 'auto-mode-alist '(".markdown" . markdown-mode))
(add-to-list 'auto-mode-alist '(".md" . markdown-mode))

(setq markdown-command "/usr/local/bin/markdown")

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

(add-to-list 'auto-mode-alist '(".js" . js2-mode))

;; elixir-mode hook
(add-hook 'elixir-mode-hook
  '(lambda ()
     (add-hook 'before-save-hook
       (lambda ()
         (untabify (point-min) (point-max))))))

;; Flycheck Elixir
(require 'flycheck-elixir)
(add-hook 'elixir-mode-hook 'flycheck-mode)

;; Dash at point
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; cider
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-wrap-history t)


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

(add-hook 'web-mode-hook
  (lambda ()
    (if (equal web-mode-content-type "javascript")
      (web-mode-set-content-type "jsx")
      (message "now set to: %s" web-mode-content-type))))

(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))


(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  )
(add-hook 'web-mode-hook  'web-mode-hook)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . web-mode))   ;; JS + JSX

;; Clojure mode hook
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojure-mode))

;; Dockerfile mode
(add-to-list 'auto-mode-alist '("\\Dockerfile\\'" . dockerfile-mode))

;; Python mode
(add-to-list 'auto-mode-alist '("\\.py?\\'" . python-mode))

;; Scala mode
(add-to-list 'auto-mode-alist '("\\.scala?\\'" . scala-mode))

;;
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; scala-mode
(add-hook 'scala-mode-hook '(lambda ()
                              (require 'whitespace)
                              (make-local-variable 'before-save-hook)
                              (add-hook 'before-save-hook 'whitespace-cleanup)
                              (whitespace-mode)

                              (local-set-key (kbd "C-x '") 'sbt-run-previous-command)

                              (local-set-key (kbd "RET") 'newline-and-indent)
                              (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
                              ))


;; Projectile mod
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)

;; Projectile Neotree
(setq projectile-switch-project-action 'neotree-projectile-action)

;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
(global-set-key (kbd "s-e") 'projectile-recentf)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

;; recentf mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Guru mode
(guru-global-mode +1)

;; Golden ratio
;; (golden-ratio-mode 1)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'company-mode-hook '(lambda ()
                                (setq company-dabbrev-downcase nil)
                                ))

;;
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)


;; Flycheck mode
(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'move-text)
(move-text-default-bindings);

;; mutiple cursors
(require 'multiple-cursors)

;; alchemist
(setq alchemist-execute-command "/usr/local/bin/elixir") ;; default: elixir
(setq alchemist-mix-command "/usr/local/bin/mix")
(setq alchemist-compile-command "/usr/local/bin/elixirc") ;; default: elixirc
(setq alchemist-iex-program-name "/usr/local/bin/iex") ;; default: iex
;; (setq alchemist-buffer-status-modeline nil)
;; (setq alchemist-key-command-prefix (kbd "C-c ,")) ;; default: (kbd "C-c a")
;; (setq alchemist-test-mode-highlight-tests nil) ;; default t
(setq alchemist-hooks-test-on-save t)

;(add-to-list 'auto-mode-alist '(".ex" . elixir-mode)) ;
(require 'elixir-mode)
(require 'alchemist)

;; Robe backend for company mode
(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-to-list 'auto-mode-alist '(".go" . go-mode));

;; popwin
(require 'popwin)
(popwin-mode 1)

(with-eval-after-load 'popwin
  (add-to-list 'popwin:special-display-config `"*ag search*")
  (add-to-list 'popwin:special-display-config `("*magit*" :noselect t))
  (add-to-list 'popwin:special-display-config `"*Flycheck errors*")
  (add-to-list 'popwin:special-display-config `"*Occur*")
  (add-to-list 'popwin:special-display-config `("*Compile-Log*" :noselect t)))

;; less-mode
(add-to-list 'auto-mode-alist '("\\.less$" . less-css-mode))

;; guide key
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)  ; Enable guide-key-mode

(setq guide-key/highlight-command-regexp
      '("rectangle"
        ("register" . font-lock-type-face)
         ("bookmark" . "hot pink")))

(setq circe-network-options
      `(("Freenode"
         :nick "adgtl"
         :channels ("#emacs" "#fauna")
         )))

;; nyan-cat
(nyan-mode 1)

;; neotree
(setq neo-smart-open t)

;; yasnippets
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))

;;
(add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode))

;; Remove trailng whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Elm
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-elm))
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)

(add-hook 'elm-mode-hook
          (lambda () (add-hook 'before-save-hook 'elm-mode-format-buffer)))


;; smooth scrolling
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

;; avy
(require 'avy)
