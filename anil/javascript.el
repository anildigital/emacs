; js2
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; js-shell
(autoload 'javascript-shell "javascript-mode" nil t)


;(defun js2-execute-buffer ()
;  (interactive)
;  (shell-command (concat "johnson " (buffer-file-name))));