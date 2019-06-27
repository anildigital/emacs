;; Elixir mode

;;; Code:

;; alchemist
(require 'alchemist)
(setq alchemist-execute-command "/usr/local/bin/elixir") ;; default: elixir
(setq alchemist-mix-command "/usr/local/bin/mix")
(setq alchemist-compile-command "/usr/local/bin/elixirc") ;; default: elixirc
(setq alchemist-iex-program-name "/usr/local/bin/iex") ;; default: iex
(setq alchemist-key-command-prefix (kbd "C-c ,")) ;; default: (kbd "C-c a")
;; alchemist testing mode
(setq alchemist-test-mode-highlight-tests nil) ;; default t
(setq alchemist-hooks-test-on-save nil)
(setq alchemist-hooks-compile-on-save nil)

(require 'elixir-mode)

;; Set elixir paths
(setq elixir-format-elixir-path "/usr/local/bin/elixir")
(setq elixir-format-mix-path "/usr/local/bin/mix")


;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; elixir's .formatter.exs
(add-hook 'elixir-format-hook (lambda ()
                                 (if (projectile-project-p)
                                      (setq elixir-format-arguments
                                            (list "--dot-formatter"
                                                  (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
                                   (setq elixir-format-arguments nil))))
;; Flycheck Elixir
(require 'flycheck-elixir)

;; Flycheck Mix
(require 'flycheck-mix)
(flycheck-mix-setup)

(eval-after-load 'flycheck
 '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)

(add-hook 'elixir-mode-hook #'smartparens-mode)

;; Flycheck Dialyxir
(eval-after-load 'flycheck
  '(flycheck-dialyxir-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)
