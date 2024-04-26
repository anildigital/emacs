(use-package
  sh-mode
  :ensure nil
  :init
  :mode (".aliases" . sh-mode)
  (".bash_profile" . sh-mode)
  (".bashrc" . sh-mode))

(use-package
  dockerfile-mode
  :ensure t
  :mode (("\\Dockerfile\\'" . dockerfile-mode)
         ("Dockerfile" . dockerfile-mode)))

(use-package
  python-mode
  :ensure t
  :mode (("\\.py?\\'" . python-mode)))

(use-package
  diff-hl
  :ensure t
  :after magit
  :hook ((magit-post-refresh-hook . diff-hl-magit-post-refresh))
  :config (global-diff-hl-mode)
  (diff-hl-dired-mode 1)
  (diff-hl-flydiff-mode 1)
  (diff-hl-margin-mode 1)
  (diff-hl-amend-mode 1))

(use-package
  ace-window
  :ensure t
  :bind
  ("C-o" . ace-window)
  ("s-o" . ace-window)
  ("C-c s" . ace-swap-window))

(use-package
  dimmer
  :ensure t
  :config (dimmer-mode))

(use-package
  move-text
  :ensure t
  :config (move-text-default-bindings)
  )

(use-package
  multiple-cursors
  :ensure t
  :bind ("C-S-c C-S-c" . mc/edit-lines)
  ("C->" . mc/mark-next-like-this)
  ("C-<" . mc/mark-previous-like-this)
  ("C-c C-<" . mc/mark-all-like-this))

(use-package
  go-mode
  :ensure t
  :mode (("\\.go?\\'" . go-mode)))

(use-package
  less-css-mode
  :ensure t
  :mode (("\\.less$" . less-css-mode)))

;; TODO check this
(use-package
  subword
  :defer t
  :diminish subword-mode
  :hook ((prog-mode . subword-mode)))

(use-package
  avy
  :ensure t
  :bind
  ("C-'" . avy-goto-char-timer)
  ("C-c u" . swiper-all)
  ("M-g f" . avy-goto-line)
  ("M-g e" . avy-goto-word-0)
  ("M-g w" . avy-goto-word-1)
  ("M-g t" . avy-goto-char-timer)
  ("C-c j" . avy-goto-word-or-subword-1)
  ("s-." . avy-goto-word-or-subword-1))

(use-package
  which-key
  :ensure t
  :delight which-key-mode
  :config (which-key-mode)
  (which-key-setup-side-window-right))

(use-package
  browse-at-remote
  :ensure t)

(use-package
  mini-frame
  :ensure t
  :config
  (custom-set-variables
   '(mini-frame-show-parameters
     '((top . 600)
       (width . 0.7)
       (left . 0.5))))
  )

(use-package
  ripgrep
  :ensure t
  :commands projectile-ripgrep)

(use-package
  undo-tree
  :ensure t
  :init
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.saves/undo")))
  :commands undo-tree-visualize
  :bind
  ("C-x u" . undo-tree-visualize)
  :config (global-undo-tree-mode))

(use-package
  poly-markdown
  :ensure t
  :after polymode
  :mode (("\\.md$" . poly-markdown-mode)))

(use-package
  dpaste
  :ensure t
  :commands dpaste-buffer
  dpaste-region-or-buffer
  dpaste-region)

(use-package
  wsd-mode
  :ensure t
  :commands wsd-mode
  :init (setq wsd-style "default"))

;; (use-package
;;   expand-region
;;   :ensure t
;;   :commands er/expand-region
;;   :init (bind-key (kbd "C-=") 'er/expand-region))

;; this is last change0
(use-package
  goto-chg
  :ensure t
  :after prog-mode
  :bind ("C-." . anil-goto-last-change)
  ("C-," . goto-last-change-reverse))

(use-package
  swiper
  :ensure t
  :bind ("M-g s" . swiper)
  ("C-s" . swiper)
  ("C-M-'" . swiper-avy))

(use-package
  terraform-mode
  :ensure t
  :mode (("\\.tf$" . terraform-mode)))

(use-package
  markdown-mode
  :ensure t
  :init
  (setq markdown-fontify-code-blocks-natively t)
  :mode ("\\.md$" . markdown-mode)
  )

(use-package
  markdown-preview-mode
  :ensure t
  :config
  (setq markdown-preview-stylesheets (list "http://thomasf.github.io/solarized-css/solarized-light.min.css"))
  )

(use-package
  dash
  :ensure t)

(use-package
  paredit
  :ensure t
  :after emacs-lisp-mode
  clojure-mode)

(use-package
  emmet-mode
  :ensure t
  :after web-mode
  :mode ("\\.html\\'" . emmet-mode)
  ("\\.eex$" . emmet--mode))

(use-package
  smartparens
  :ensure t
  :delight smartparens
  :defer t)

(use-package
  discover-my-major
  :ensure t
  :commands discover-my-major)

(use-package
  git-timemachine
  :ensure t
  :commands git-timemachine
  :bind
  ("C-c m" . git-timemachine)
  )

(use-package
  scss-mode
  :ensure t
  :mode ("\\.scss\\'" . scss-mode))

(use-package rainbow-mode
  :ensure t
  :commands rainbow-mode
  :diminish
  :hook (
         (web-mode . rainbow-mode)
         (css-mode . rainbow-mode)
         )
  )

(use-package
  editorconfig
  :ensure t
  :mode (".editorconfig" . editorconfig-mode))

(use-package
  feature-mode
  :ensure t
  :defer t)

(use-package
  bind-key
  :ensure t)

(use-package
  htmlize
  :ensure t
  :defer t)

(use-package
  s
  :ensure t
  :defer t)

(use-package
  counsel-world-clock
  :ensure t
  :defer t)

(use-package
  restclient
  :ensure t
  :defer t)

(use-package
  ag
  :ensure t
  :commands counsel-ag)

(use-package
  graphql-mode
  :ensure t
  :mode ("\\.graphql$" . graphql-mode))

(use-package
  anzu
  :ensure t
  :commands anzu-query-replace)

(use-package
  zop-to-char
  :ensure t)

(use-package
  super-save
  :ensure t
  :delight super-save-mode
  :config (super-save-mode +1))

(use-package
  nginx-mode
  :ensure t
  :defer t)

(use-package
  git-gutter
  :ensure t
  :hook (emacs-lisp-mode . git-gutter-mode)
  (markdown-mode . git-gutter-mode)
  (dockerfile-mode . git-gutter-mode)
  (ruby-mode . git-gutter-mode)
  (elixir-ts-mode . git-gutter-mode)
  (js2-mode . git-gutter-mode)
  :config (git-gutter-mode))


(use-package deft
  :ensure t
  :init
  (setq deft-extensions '("org")
        deft-directory "~/org"
        deft-recursive t
        deft-extensions '("md" "org"))
  :config
  (defun cm/deft-parse-title (file contents)
    "Parse the given FILE and CONTENTS and determine the title.
  If `deft-use-filename-as-title' is nil, the title is taken to
  be the first non-empty line of the FILE.  Else the base name of the FILE is
  used as title."
    (let ((begin (string-match "^#\\+[tT][iI][tT][lL][eE]: .*$" contents)))
      (if begin
          (string-trim (substring contents begin (match-end 0)) "#\\+[tT][iI][tT][lL][eE]: *" "[\n\t ]+")
        (deft-base-filename file))))

  (advice-add 'deft-parse-title :override #'cm/deft-parse-title)

  (setq deft-strip-summary-regexp
        (concat "\\("
                "[\n\t]" ;; blank
                "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
                "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
                "\\)"))
  ;; deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n"
  ;;   deft-strip-summary-regexp  (concat "\\("
  ;; "[\n\t]" ;; blank
  ;; "\\|^#\\+[[:alpha:]_]+:.*$" ;; org-mode metadata
  ;; "\\|^:PROPERTIES:\n\\(.+\n\\)+:END:\n"
  ;; "\\)"))
  :commands (deft)
  :bind
  ("C-c n d" . deft)
  )

(use-package
  protobuf-mode
  :ensure t
  :mode (("\\.proto$" . protobuf-mode))
  :bind
  ("M-]" . anil-align-to-equals)
  )

(use-package
  mermaid-mode
  :ensure t
  :mode (("\\.mmd$" . mermaid-mode)))

(use-package
  all-the-icons
  :ensure t)

(use-package
  winner
  :init (winner-mode))


(use-package
  annotate
  :ensure t
  :hook ((prog-mode . annotate-mode))
  )

(use-package
  popper
  :ensure t
  :bind (("C-`"   . popper-toggle)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  ;; :hook (
  ;;        (popper-open-popup-hook . centaur-tabs-local-off)
  ;;        (vterm-mode-hook . centaur-tabs-local-off)
  ;;        )
  ;; :config
  ;; (defun centaur-tabs-local-off ()
  ;;  (centaur-tabs-local-mode 1))
  :init
  (setq popper-window-height 0.33)
  (setq popper-reference-buffers '("eshell*"
                                   "shell*"
                                   "vterm"
                                   "*SQL"
                                   "*exunit-compilation*"
                                   help-mode
                                   compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

(use-package
  persistent-scratch
  :ensure t
  :config (persistent-scratch-setup-default))

(use-package link-hint
  :ensure t
  :bind
  ("C-c l o" . link-hint-open-link)
  ("C-c l c" . link-hint-copy-link))

(use-package vterm
  :ensure t
  :init
  (setq vterm-shell "/usr/local/bin/fish")
  (setq vterm-buffer-name-string "%s")
  :bind
  (:map vterm-mode-map
        ("C-o" . ace-window)
        ("C-s" . swiper)
        ("M-<" . beginning-of-buffer)
        ("M->" . end-of-buffer)
        ))

(use-package
  rainbow-delimiters
  :ensure t
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode)
  )

(use-package volatile-highlights
  :ensure t
  :config
  (volatile-highlights-mode t)
  )

(use-package switch-buffer-functions
  :ensure t
  :after recentf
  :preface
  (defun anil/recentf-track-visited-file (_prev _curr)
    (and buffer-file-name
         (recentf-add-file buffer-file-name)))
  :init
  (add-hook 'switch-buffer-functions #'anil/recentf-track-visited-file))

(use-package csv-mode
  :ensure t
  )

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

(use-package persp-mode
  :ensure t
  :custom
  (persp-keymap-prefix (kbd "C-x p"))
  (persp-auto-save-num-of-backups 1)
  (persp-autokill-buffer-on-remove 'kill-weak)
  (persp-nil-name "default")
  (persp-set-last-persp-for-new-frames nil)
  (persp-auto-resume-time 0)

 :preface
 (defun anil-persp-mode-filter-magit-buffers (buf)
   (or (string-prefix-p "*" (buffer-name buf))
       (string-prefix-p "magit" (buffer-name buf))
    ))

  (defun anil-persp-before-kill-hook (persp)
    "Remove the killed perspective's name from persp-recent-persps."
    (let* ((frame (selected-frame))
           (recent-list (frame-parameter frame 'persp-recent-persps))
           (most-recent (nth 1 recent-list))
           (persp-name (safe-persp-name persp))
           (current-persp (safe-persp-name (get-current-persp))))

      (set-frame-parameter frame 'persp-recent-persps
                           (delete persp-name recent-list))
      (set-frame-parameter frame 'persp-recent-just-killed persp-name)

      (if (and most-recent (equal persp-name current-persp))
          (persp-frame-switch most-recent frame))))

  :hook ((after-init . persp-mode)
         (emacs-startup . toggle-frame-maximized))

  :bind
  ("C-s-w" . persp-window-switch)

  :init
  ;; Do not auto save/load in terminal. My main instance of Emacs runs in GUI,
  ;; terminal based instances are for smaller random things.
  (when (not window-system)
    (setq persp-auto-resume-time -1
          persp-auto-save-opt 0))

  :config
  (persp-mode)
  (add-hook 'persp-common-buffer-filter-functions
            'anil-persp-mode-filter-magit-buffers)

  (add-hook 'persp-before-kill-functions 'anil-persp-before-kill-hook)
  )
