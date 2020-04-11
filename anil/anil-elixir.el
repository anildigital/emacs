;; ;; elixir mode

(use-package erlang
  :mode "\\.erl$")


(use-package
  elixir-mode
  :ensure t
  :hook
  (elixir-mode . lsp)
  (elixir-mode . flycheck-mode)
  (elixir-mode . smartparens-mode)
  (elixir-mode . mix-minor-mode)

  :config
  (add-hook 'elixir-mode-hook (lambda ()
                                (add-hook 'before-save-hook 'lsp-format-buffer)))
  ;;(elixir-mode . lsp)
  :custom
  (rr/elixir-symbols '(;; Syntax
                       ("*" . ?⚹)
                       ("==" . #x2a75)
                       ("!=" . #x2260)
                       ("->" . #x27f6)
                       ("<-" . #x27f5)
                       ("<=" . #x2a7d)
                       (">=" . #x2a7e)
                       ("::" . #x2e2c)
                       ("<>" . (?≺ (Br Bl -24 0) ?≻))
                       ("<<" . (?≺ (Br Bl -45 0) ?≺ (Br Bl -100 0) ?\s))
                       (">>" . (?\s (Br Bl -100 0) ?≻ (Br Bl -45 0) ?≻))
                       ("++" . (?+ (Br Bl -35 0) ?+))
                       ("--" . (?- (Br Bl -33 0) ?-))
                       ("|>" . #x2b9a)
                       ;; ("not" . #x2757)
                       ;; ("in" . #x2208)
                       ;; ("not in" . #x2209)
                       ("fn" . #x1d6cc)
                       ;; ("for" . ?∀)
                       ;; ("raise" . ?🔥)
                       ;; ("when" . #x2235)
                       ;; ("do" . (?\s (Bl Bl 35 25) ?〯))
                       ;; ("end" . ?·)

                       ;; messages
                       ;; ("self" . (?𝔰 (Br . Bl)
                       ;;               ?𝔢 (Br . Bl)
                       ;;               ?𝔩 (Br . Bl)
                       ;;               ?𝔣))
                       ;; ("send" . (?𝔰 (Br . Bl)
                       ;;               ?𝔢 (Br . Bl)
                       ;;               ?𝔫 (Br . Bl)
                       ;;               ?𝔡))
                       ;; ("send" . ?⟼)
                       ;; ("receive" . (?𝔯 (Br . Bl)
                       ;;                  ?𝔢 (Br . Bl)
                       ;;                  ?𝔠 (Br . Bl)
                       ;;                  ?𝔢 (Br . Bl)
                       ;;                  ?𝔦 (Br . Bl)
                       ;;                  ?𝔳 (Br . Bl)
                       ;;                  ?𝔢))
                       ;; ("receive" . ?⟻)
                       ;; ("pid" . (?𝔭 (Br . Bl)
                       ;;              ?𝔦 (Br . Bl)
                       ;;              ?𝔡))
                       ;; ("after" . (?𝔞 (Br . Bl)
                       ;;                ?𝔣 (Br . Bl)
                       ;;                ?𝔱 (Br . Bl)
                       ;;                ?𝔢 (Br . Bl)
                       ;;                ?𝔯))

                       ;; ;; Defs
                       ;; ("def" . ?ℱ)
                       ;; ("defp" . (?ℱ (Br Bl 50 0) ?➖))
                       ;; ("defmodule" . ?ℳ)
                       ;; ("defprotocol" . ?𝒫)
                       ;; ("defimpl" . ?𝒥)
                       ;; ("defexception" . ?ℰ)
                       ;; ("defstruct" . ?𝑺)
                       ;; ("defmacro" . ?𝛴)
                       ;; ("defmacrop" . (?𝛴 (Br Bl 50 0) ?➖))

                       ;; ;; modules
                       ;; ("alias" . ?α)
                       ;; ("import" . ?𝜾)
                       ;; ("use" . ?μ)
                       ;; ("require" . ?ρ)

                       ;; Base Types
                       ;; ("true" . #x1d54b)
                       ;; ("false" . #x1d53d)
                       ;; ("nil" . #x2205)

                       ;; types
                       ;; ("any" . #x2754)
                       ;; ("integer" . #x2124)
                       ;; ("float" . #x211d)
                       ))
  :bind
  (:map elixir-mode-map
        ("C-c C-s" . inferior-elixir)
        ("C-c C-d" . lsp-ui-doc-show))
  )

(use-package flycheck-mix
  :after (flycheck elixir-mode)
  :hook
  (elixir-mode . flycheck-mix-setup))

(use-package
  lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook (elixir-mode . lsp)
  :init (add-to-list 'exec-path "/Users/anil/Code/elixir-ls/release")
  :custom
  (lsp-restart 'ignore)
  (lsp-auto-guess-root t)
  (lsp-response-timeout 5)
  (lsp-prefer-flymake nil)
  )

(use-package company-lsp
  :commands company-lsp)


(use-package
  lsp-ui
  :ensure t
  :custom
  (lsp-ui-flycheck-enable t)
  (lsp-ui-peek-enable nil)
  (lsp-ui-sideline-enable nil)
  (lsp-ui-doc-enable nil)
  :config
  (add-to-list 'lsp-file-watch-ignored "\\.asdf")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]node_modules$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.git$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]\\.elixir_ls$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]deps$")
  (add-to-list 'lsp-file-watch-ignored "[/\\\\]_build$")
  )

(use-package company-lsp
  :commands company-lsp)

(use-package
  exunit
  :ensure t)

(use-package flycheck-credo
  :after (flycheck elixir-mode)

  :custom
  (flycheck-elixir-credo-strict t)

  :hook
  (elixir-mode . flycheck-credo-setup))

(use-package
  flycheck-dialyxir
  :ensure t)

(use-package
  flycheck
  :no-require t
  :init
  :config (flycheck-credo-setup)
  (flycheck-dialyxir-setup))
