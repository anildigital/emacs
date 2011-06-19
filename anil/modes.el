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
(speedbar 1)
(speedbar-add-supported-extension ".rb")

;; enable ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Magit is an interface to Git for Emacs
(add-to-list 'load-path "~/.emacs.d/vendor/magit/")
(require 'magit)
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))