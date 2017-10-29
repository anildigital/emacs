;; coffee
(setq coffee-tab-width 2)
(custom-set-variables
 '(coffee-tab-width 2)
 '(flycheck-coffeelintrc "~/.emacs.d/coffeelint.json"))

(add-hook 'coffee-mode-hook 'flymake-mode)
