(require 'lua-mode)

;; use an indentation width of two spaces
(setq lua-indent-level 2)

(defun lua-insert-puts ()
  (interactive)
  (insert "puts()")
  (backward-char))

(defun lua-rake-run ()
  (interactive)
  (shell-command "rake run"))

(add-hook 'lua-mode-hook
          '(lambda ()
             (define-key lua-mode-map (kbd "A-r") 'lua-rake-run)
             (define-key lua-mode-map "\C-L" 'lua-insert-puts)))
