(defun coffee-custom ()
  "coffee-mode-hook"

  ;; CoffeeScript uses two spaces.
  (set (make-local-variable 'tab-width) 2)

  ;; js2 mode
  (setq coffee-js-mode 'js2-mode)

  ;; If you don't want your compiled files to be wrapped
  (setq coffee-args-compile '("-c" "--no-wrap"))

  ;; *Messages* spam
  (setq coffee-debug-mode t)

  ;; Emacs key binding
  (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)

  ;; Riding edge.
  (setq coffee-command "/usr/local/share/npm/bin/coffee"))

;; Compile '.coffee' files on every save
(add-hook 'after-save-hook
          '(lambda ()
             (when (string-match "\.coffee$" (buffer-name))
               (coffee-compile-file))))

(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))



;; taken from defunkt's emacs config
(defun anil-coffee-mode-hook ()
  "anil's hacks and experiments for `coffee-mode.el'."

  ;; Compile .js on every save.
  ;;   (add-hook 'before-save-hook
  ;;             '(lambda ()
  ;;                (when (not (string= (buffer-name) "Cakefile"))
  ;;                  (shell-command "cake build"))))



  ;; aww yeah
  (define-key coffee-mode-map "\C-L" 'coffee-insert-console)

  ;; I like debug mode, sometimes.
  (setq coffee-debug-mode nil))

(add-hook 'coffee-mode-hook (lambda () (anil-coffee-mode-hook)))

(defadvice textmate-next-line (around coffee-tm-next-line)
  (interactive)
  (if (string= major-mode "coffee-mode")
      (progn
        (end-of-line)
        (coffee-newline-and-indent))
    ad-do-it))
(ad-activate 'textmate-next-line)

(defun coffee-insert-console ()
  (interactive)
  (insert "console.log "))
