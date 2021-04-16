(use-package
  ivy
  :ensure t
	:diminish ivy-mode
  :init (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind ("C-c C-r" . ivy-resume)
  :config (ivy-mode 1))


(use-package
  counsel
  :ensure t
	:diminish counsel-mode
  :bind
	("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x C-r" . counsel-recentf)
	("C-x b" . counsel-switch-buffer)
	("s-b" . counsel-buffer-or-recentf)
	)

(use-package
  counsel-dash
  :ensure t
  :init (setq counsel-dash-common-docsets '("Ruby", "Javascript" "HTML", "Elixir", "Phoenix"))
  (add-hook 'emacs-lisp-mode-hook (lambda ()
                                    (setq-local counsel-dash-docsets '("Emacs Lisp"))))
  (add-hook 'ruby-mode-hook (lambda ()
                              (setq-local counsel-dash-docsets '("Ruby"))))
  (add-hook 'ruby-mode-hook (lambda ()
                              (setq-local counsel-dash-docsets '("Phoenix"))))
  (setq counsel-dash-docsets-path "~/.docset")
  (setq counsel-dash-docsets-url "https://raw.github.com/Kapeli/feeds/master")
  (setq counsel-dash-min-length 3)
  (setq counsel-dash-candidate-format "%d %n (%t)")
  (setq counsel-dash-enable-debugging nil)
  (setq counsel-dash-browser-func 'browse-url)
  (setq counsel-dash-ignored-docsets nil)
  :bind
	("C-c C-o" . counsel-dash)
	)

(use-package
	ivy-prescient
	:ensure t
	:after counsel
	:config
	(ivy-prescient-mode 1))

(use-package
	ivy-rich
	:ensure t
	:after ivy
	)
