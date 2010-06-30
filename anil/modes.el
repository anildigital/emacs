(load "anil/erc") 

(cond ((or (featurep 'aquamacs) (featurep 'ns))
       (load "anil/ecb")
       (vendor 'ecb)))

;; textmate.el
(vendor 'textmate)
(textmate-mode)


; markdown
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ron" . markdown-mode) auto-mode-alist))
(add-hook 'markdown-mode-hook '(lambda ()
                                 (define-key markdown-mode-map (kbd "A-r") 'markdown-preview)))

; textile
(setq auto-mode-alist (cons '("\\.textile" . textile-mode) auto-mode-alist))
(add-hook 'textile-mode-hook 'flyspell-mode)

; paredit
(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))


; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;; Correct spelling on commit messages.
(add-hook 'magit-log-edit-mode-hook 'flyspell-mode)

;; Cosmetics
 
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

; git commit msg 
(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))


; mode-compile
(autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
 
(autoload 'mode-compile-kill "mode-compile"
 "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)


; c
(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-auto-newline t)
             (define-key c-mode-map "{" 'anil/c-electric-brace)))
 
(setq show-trailing-whitespace (not buffer-read-only))


;yaml mode
(setq auto-mode-alist (cons '("\\.yml" . yaml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.yaml" . yaml-mode) auto-mode-alist))

;sh mode
(setq auto-mode-alist (cons '(".bashrc" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".bash_profile" . sh-mode) auto-mode-alist)) 
(setq auto-mode-alist (cons '(".bash_aliases" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '(".aliases" . sh-mode) auto-mode-alist))  


;; google maps

(add-to-list 'load-path "~/.emacs.d/vendor/jd-el")
(require 'google-maps)


; rvm
(vendor 'rvm)
(rvm-use-default)
