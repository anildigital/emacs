(setq exec-path (append exec-path '("/usr/local/bin")))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(provide 'path)
