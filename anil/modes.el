;; others
(load "anil/dired")
(load "anil/ruby")
(load "anil/shell")
(load "anil/javascript")


; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))


; markdown
(add-to-list 'load-path "~/elisp/vendor/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))


; paredit
(autoload 'paredit-mode "paredit"
     "Minor mode for pseudo-structurally editing Lisp code."
     t)
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))


; jasper
(setq auto-mode-alist (cons '("\\.jr" . emacs-lisp-mode) auto-mode-alist))

; mode-compile
(autoload 'mode-compile "mode-compile"
   "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)

(autoload 'mode-compile-kill "mode-compile"
 "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)


; ido
(ido-mode t)
(setq ido-enable-flex-matching t)


;;
;; erc
;;
;; channel name in prompt
(setq erc-prompt (lambda ()
                   (if (and (boundp 'erc-default-recipients) (erc-default-target))
                       (erc-propertize (concat (erc-default-target) ">") 'read-only t 'rear-nonsticky t 'front-nonsticky t)
                     (erc-propertize (concat "ERC>") 'read-only t 'rear-nonsticky t 'front-nonsticky t))))
 
(setq erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE"))
(setq erc-autojoin-channels-alist '(("freenode.net" "#fauna" "#emacs")))



