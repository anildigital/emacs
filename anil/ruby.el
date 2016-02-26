;; chruby
(require 'chruby)
(chruby "ruby-2.3.0")

(eval-after-load 'ruby-mode
  '(progn
     (setq ruby-use-encoding-map nil) ;;don't autoadd encoding comment at the top
     (require 'inf-ruby)
     (add-hook 'ruby-mode-hook 'inf-ruby-keys)
     (require 'ruby-electric)
     (add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))
     (add-hook 'ruby-mode-hook (lambda () (robe-mode t)))
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")
     ))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))

;; Ruby style guide
;; From https://github.com/bbatsov/ruby-style-guide
(setq whitespace-style '(trailing space-before-tab
                         indentation space-after-tab))

(add-hook 'ruby-mode-hook (lambda () (subword-mode 1)))


(add-hook 'ruby-mode-hook
          (idle-highlight-mode t))


(provide 'ruby)
;;; ruby.el ends here
