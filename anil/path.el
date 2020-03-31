(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :init
    (setq exec-path (append exec-path '("/usr/local/bin")))
    :config
    (exec-path-from-shell-initialize)))
