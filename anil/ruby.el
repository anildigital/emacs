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
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))



;; Ruby style guide
;; From https://github.com/bbatsov/ruby-style-guide
(setq whitespace-style '(trailing space-before-tab
                         indentation space-after-tab))




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
            (ruby-electric-mode t)
						(idle-highlight-mode t)))





;; flymake

(require 'flymake)

(when (featurep 'flymake)
  (add-hook 'ruby-mode-hook 'flymake-ruby-load))
