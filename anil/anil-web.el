;; (use-package web-mode
;;   :ensure t
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.eex?\\'" . web-mode))
;;   (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;   (setq web-mode-enable-current-element-highlight t)
;;   (setq web-mode-enable-current-column-highlight t)
;;   (setq js-indent-level 2)
;;   (setq-default indent-tabs-mode nil)
;;   (setq javascript-indent-level 2)
  
;;   :config
;;   (add-hook 'web-mode-hook  'anil-web-mode-hook)
;;   (bind-key (kbd "M-n") 'web-mode-tag-match web-mode-map)
;;   )

(defun anil-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (emmet-mode)
  (set (make-local-variable 'company-backends) '(company-css company-yasnippet company-files))
  )


(use-package web-mode
  :ensure t
  :mode
  (("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.html?\\'" . web-mode)
   ("\\.eex?\\'" . web-mode)
   ("\\.html?\\'" . web-mode))
  :custom ((web-mode-enable-current-element-highlight t)
	   (web-mode-enable-current-column-highlight t)
	   (js-indent-level 2)
	   (default indent-tabs-mode nil)
	   (javascript-indent-level 2))
  :hook (web-mode-hook . anil-web-mode-hook)
  :bind (:map web-mode-map
	      ("M-n" . web-mode-tag-match)))
