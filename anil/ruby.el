(eval-after-load 'ruby-mode
  '(progn
     (setq ruby-use-encoding-map nil) ;;don't autoadd encoding comment at the top
		 (require 'inf-ruby)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
		 (require 'ruby-electric)
		 (add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")
		 ))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))