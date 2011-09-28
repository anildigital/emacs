(add-to-list 'load-path "~/.emacs.d/vendor/inf-ruby.el")
(add-to-list 'load-path "~/.emacs.d/vendor/ruby-electric.el")

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
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))



;; Add this to ~/.emacs

;; Missing from ruby-mode.el, see https://groups.google.com/group/emacs-on-rails/msg/565fba8263233c28
(defun ruby-insert-end () 
  "Insert \"end\" at point and reindent current line." 
  (interactive) 
  (insert "end") 
  (ruby-indent-line t) 
  (end-of-line)) 

(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'ruby-electric)
            (ruby-electric-mode t)))
