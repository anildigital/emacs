;; Elixir mode

;;; Code:

(require 'elixir-mode)

;; Set elixir paths
;; (setq elixir-format-elixir-path "/usr/local/bin/elixir")
;; (setq elixir-format-mix-path "/usr/local/bin/mix")


(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'eglot-format-buffer nil t)))

;; ;; elixir's .formatter.exs
;; (add-hook 'elixir-format-hook (lambda ()
;;                                  (if (projectile-project-p)
;;                                       (setq elixir-format-arguments
;;                                             (list "--dot-formatter"
;;                                                   (concat (locate-dominating-file buffer-file-name ".formatter.exs") ".formatter.exs")))
;;                                    (setq elixir-format-arguments nil))))


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

(require 'eglot)
(add-to-list 'eglot-server-programs `(elixir-mode "/Users/anil/Code/elixir-ls/release/language_server.sh"))


(add-hook 'elixir-mode-hook 'eglot-ensure)


;; exunit
(require 'exunit)
