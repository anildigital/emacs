;; Elixir mode

;; alchemist
(setq alchemist-execute-command "/usr/local/bin/elixir") ;; default: elixir
(setq alchemist-mix-command "/usr/local/bin/mix")
(setq alchemist-compile-command "/usr/local/bin/elixirc") ;; default: elixirc
(setq alchemist-iex-program-name "/usr/local/bin/iex") ;; default: iex
;; (setq alchemist-buffer-status-modeline nil)
;; (setq alchemist-key-command-prefix (kbd "C-c ,")) ;; default: (kbd "C-c a")
;; (setq alchemist-test-mode-highlight-tests nil) ;; default t
(setq alchemist-hooks-test-on-save t)

(require 'elixir-mode)
(require 'alchemist)

;; elixir-mode hook
(add-hook 'elixir-mode-hook
  '(lambda ()
     (add-hook 'before-save-hook
       (lambda ()
         (untabify (point-min) (point-max))))))

;; Flycheck Elixir
(require 'flycheck-elixir)

(eval-after-load 'flycheck
 '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)
