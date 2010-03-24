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



; magit
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))



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