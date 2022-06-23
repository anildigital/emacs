(use-package
  ivy
  :straight t
  :diminish ivy-mode
  :init (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :bind ("C-c C-r" . ivy-resume)
  :config (ivy-mode 1))

(use-package
  counsel
  :straight t
  :diminish counsel-mode
  :config
  (ivy-set-actions
   'counsel-buffer-or-recentf
   '(("j" find-file-other-window "other window")
     ("f" find-file-other-frame "other frame")
     ("x" counsel-find-file-extern "open externally")
     ("d" (lambda (file) (setq recentf-list (delete file recentf-list)))
      "delete from recentf")))

  (defun anil/counsel-buffer-or-recentf-candidates ()
    "Return candidates for `counsel-buffer-or-recentf'."
    (require 'recentf)
    (recentf-mode)
    (let ((buffers
           (delq nil
                 (mapcar (lambda (b)
                           (when (buffer-file-name b)
                             (abbreviate-file-name (buffer-file-name b))))
                         (delq (current-buffer) (buffer-list))))))
      (append
       buffers
       (cl-remove-if (lambda (f) (member f buffers))
                     (counsel-recentf-candidates)))))

  (advice-add #'counsel-buffer-or-recentf-candidates
              :override #'anil/counsel-buffer-or-recentf-candidates)

  :bind ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-x C-r" . counsel-recentf)
  ("C-x b" . counsel-switch-buffer)
  ("s-b" . counsel-buffer-or-recentf))

(use-package
  counsel-dash
  :straight t
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
  :bind ("C-c C-o" . counsel-dash))

(use-package
  ivy-prescient
  :straight t
  :after counsel
  :config (ivy-prescient-mode 1))

(use-package ivy-rich
  :straight t
  :after (ivy counsel)
  :init
  (setq ivy-rich-path-style 'abbrev
        ivy-virtual-abbreviate 'full)
  :config (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :straight t
  :init (all-the-icons-ivy-rich-mode 1))
