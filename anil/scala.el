
;; scala-mode
(add-hook 'scala-mode-hook '(lambda ()
                              (require 'whitespace)
                              (make-local-variable 'before-save-hook)
                              (add-hook 'before-save-hook 'whitespace-cleanup)
                              (whitespace-mode)
                              (ensime-mode)
                              (scala-mode:goto-start-of-code)
                              (local-set-key (kbd "C-x '") 'sbt-run-previous-command)
                              (local-set-key (kbd "RET") 'newline-and-indent)
                              (local-set-key (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)
                              ))
