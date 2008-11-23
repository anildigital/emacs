;; others
(load "anil/dired")
(load "anil/ruby")
(load "anil/shell")
(load "anil/javascript")


; bash
(setq auto-mode-alist (cons '("\\.bashrc" . sh-mode) auto-mode-alist))


; markdown
(add-to-list 'load-path "~/.emacs.d/vendor/markdown-mode")
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

(defun ido-goto-symbol ()
    "Will update the imenu index and then use ido to select a symbol to navigate to"
    (interactive)
    (imenu--make-index-alist)
    (let ((name-and-pos '())
          (symbol-names '()))
      (flet ((addsymbols (symbol-list)
                         (when (listp symbol-list)
                           (dolist (symbol symbol-list)
                             (let ((name nil) (position nil))
                               (cond
                                ((and (listp symbol) (imenu--subalist-p symbol))
                                 (addsymbols symbol))
   
                                ((listp symbol)
                                 (setq name (car symbol))
                                 (setq position (cdr symbol)))
   
                                ((stringp symbol)
                                 (setq name symbol)
                                 (setq position (get-text-property 1 'org-imenu-marker symbol))))
   
                               (unless (or (null position) (null name))
                                 (add-to-list 'symbol-names name)
                                 (add-to-list 'name-and-pos (cons name position))))))))
        (addsymbols imenu--index-alist))
      (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
             (position (cdr (assoc selected-symbol name-and-pos))))
        (goto-char position))))


