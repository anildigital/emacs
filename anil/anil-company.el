(use-package
  company
  :straight t
  :delight company-mode
  :hook (after-init . global-company-mode)
  :config (setq company-dabbrev-downcase nil)
  (setq company-format-margin-function #'company-vscode-light-icons-margin)
  (push 'company-robe company-backends)
  ;; complete by copilot first, then company-mode
  (defun anil-tab ()
    (interactive)
    (or (copilot-accept-completion)
        (company-indent-or-complete-common nil)))
  ;; modify company-mode behaviors
  (with-eval-after-load 'company
    ;; disable inline previews
    (delq 'company-preview-if-just-one-frontend company-frontends)

    (define-key company-mode-map (kbd "<backtab>") 'anil-tab)
    (define-key company-active-map (kbd "<backtab>") 'anil-tab)
    )
  )
