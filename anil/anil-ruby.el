(use-package
  rbenv
  :ensure t
  :config (global-rbenv-mode))

(use-package
  robe
  :ensure t)

(use-package
  ruby-electric
  :ensure t)
(use-package
  rubocop
  :ensure t)
(use-package
  rbenv
  :ensure t)

(use-package
  ruby-mode
  :ensure nil
  :mode (("\\.rake$" . ruby-mode)
         ("Gemfile$" .  ruby-mode)
         ("Rakefile$" . ruby-mode)
         ("Capfile$" . ruby-mode)
         ("\\.gemspec$" . ruby-mode)
         ("\\.ru$" . ruby-mode))
  :config (progn
            (setq ruby-use-encoding-map nil) ;;don't autoadd encoding comment at the top
            (setq whitespace-style '(trailing space-before-tab indentation space-after-tab))
            (autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
            (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
            (add-hook 'ruby-mode-hook (lambda ()
                                        (ruby-electric-mode t)))
            (add-hook 'ruby-mode-hook (lambda ()
                                        (robe-mode t)))
            (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
            (define-key ruby-mode-map (kbd "C-c l") "lambda")
            ))
