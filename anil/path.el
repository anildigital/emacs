(when (memq window-system '(mac ns))
  (use-package
    exec-path-from-shell
    :straight t
    :init
    ;; (setq exec-path-from-shell-debug t)
    (setq exec-path (append exec-path '("/usr/local/bin")))
    :config (exec-path-from-shell-initialize)))
