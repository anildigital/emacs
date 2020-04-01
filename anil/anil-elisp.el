(defun my-emacs-lisp-mode-before-save-hook ()
  (when (eq major-mode 'emacs-lisp-mode)
    (elisp-format-buffer)))
(add-hook 'before-save-hook #'my-emacs-lisp-mode-before-save-hook)
