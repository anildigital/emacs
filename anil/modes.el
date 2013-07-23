;; save place in files between Sessions
(require 'saveplace)
(setq-default save-place t)

;; uniquify buffer names.
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; enable speedbar mode
;; (speedbar 1)
;; (speedbar-add-supported-extension ".rb")
;; (speedbar-add-supported-extension ".rake")
;; (speedbar-add-supported-extension ".yml")
;; (speedbar-add-supported-extension ".erb")



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


;; scpaste
(require 'scpaste)
(autoload 'scpaste "scpaste" "Paste the current buffer." t nil)
(setq scpaste-http-destination "http://anildigital.io/notes"
      scpaste-scp-destination "anil@anildigital.io:notes")



;; rvm mode
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session


(add-hook 'js-mode-hook
      '(lambda ()
         (add-hook 'before-save-hook
                   (lambda ()
                     (untabify (point-min) (point-max))))))

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Gitx
(load-file "~/.emacs.d/vendor/gitx.el")
