(defun anil-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-indent-style 2)
  (local-set-key (kbd "RET") 'newline-and-indent)
  (set (make-local-variable 'company-backends)
       '(company-css company-yasnippet company-files)))


(use-package emmet-mode
  :ensure t
  :hook ((html-mode . emmet-mode)
         (css-mode  . emmet-mode)
         (sgml-mode . emmet-mode)
         (sass-mode . emmet-mode)
         (web-mode  . emmet-mode)
         (scss-mode . emmet-mode)))

(use-package css-mode
  :mode
  (".css?$" . css-mode))

(use-package
  web-mode
  :ensure t
  :init
  (setq web-mode-engines-alist
        '(("elixir" . ".html\\.eex$")
          ("elixir" . ".html\\.leex$")
          ("elixir" . ".sface$")
          ))
  :custom ((web-mode-enable-current-element-highlight t)
           (web-mode-enable-current-column-highlight t)
           (js-indent-level 2)
           (default indent-tabs-mode nil)
           (javascript-indent-level 2))
  :hook (web-mode-hook . anil-web-mode-hook)
  :mode
  (
   ".erb$"
   ".html?$"
   ".vue$"
   ".eex$"
   ".sface$"
   "html\\.eex$"
   "html\\.leex$"
   )
  :bind (:map web-mode-map
              ("M-n" . web-mode-tag-match)))
