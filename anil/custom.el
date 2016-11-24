;; ;; customization
;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(aquamacs-additional-fontsets nil t)
;;  '(aquamacs-customization-version-id 213 t)
;;  '(aquamacs-tool-bar-user-customization nil t)
;;  '(cua-mode nil nil (cua-base))
;;  '(default-frame-alist (quote ((font . "-apple-inconsolata-medium-r-normal--20-150-72-72-m-150-iso10646-1") (tool-bar-lines . 0) (vertical-scroll-bars) (background-color . "#141414") (background-mode . dark) (border-color . "black") (cursor-color . "#A7A7A7") (foreground-color . "#F8F8F8") (mouse-color . "sienna1"))))
;;  '(erc-modules (quote (autojoin button completion fill irccontrols match menu netsplit noncommands readonly ring scrolltobottom stamp track)))
;;  '(global-linum-mode t)
;;  '(javascript-shell-command "node")
;;  '(markdown-command "/usr/local/bin/markdown")
;;  '(ns-tool-bar-display-mode nil t)
;;  '(ns-tool-bar-size-mode nil t)
;;  '(python-honour-comment-indentation nil)
;;  '(ruby-deep-arglist nil)
;;  '(ruby-deep-indent-paren nil)
;;  '(ruby-deep-indent-paren-style nil)
;;  '(standard-indent 2)
;;  '(tabbar-mode nil nil (tabbar))
;;  '(text-mode-hook (quote (smart-spacing-mode)))
;;  '(visual-line-mode nil t))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :family "apple-inconsolata"))))
;;  '(autoface-default ((t (:inherit default :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :family "apple-inconsolata"))))
;;  '(emacs-lisp-mode-default ((t (:inherit autoface-default))) t)
;;  '(minibuffer-prompt ((((background dark)) (:foreground "cyan" :height 150))))
;;  '(mode-line ((t (:inherit aquamacs-variable-width :background "grey75" :foreground "black" :width normal))))
;;  '(text-mode-default ((t (:inherit autoface-default)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	 (quote
		("53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" default)))
 '(org-agenda-files (quote ("~/Dropbox/Org files/inbox.org")))
 '(package-selected-packages
	 (quote
		(elm-modeb nyan-mode twittering-mode circe wsd-mode paradox guide-key popwin ido-vertical-mode less-css-mode browse-kill-ring neotree company-tern tern react-snippets feature-mode editorconfig alchemist elixir-mode rainbow-mode git-timemachine js2-mode discover-my-major smartparens golden-ratio move-text ag goto-chg expand-region flycheck guru-mode sublime-themes web-mode emmet-mode grizzl ensime helm projectile dockerfile-mode ace-window avy popup paredit go-mode cider coffee-mode yaml-mode idle-highlight-mode gist lua-mode textmate scpaste enh-ruby-mode ruby-electric robe perspective markdown-mode multiple-cursors git-gutter yasnippet git-lens magit chruby ruby-compilation exec-path-from-shell)))
 '(paradox-github-token t)
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "green3"))))
 '(diff-removed ((t (:foreground "red3")))))
