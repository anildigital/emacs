; js2
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; js-shell
(autoload 'javascript-shell "javascript-mode" nil t)

(add-hook 'js2-mode-hook
          '(lambda ()
             (setq js2-basic-offset 4)))


;(defun js2-execute-buffer ()
;  (interactive)
;  (shell-command (concat "johnson " (buffer-file-name))));