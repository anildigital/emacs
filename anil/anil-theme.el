;; theme

(use-package
  dracula-theme
  :ensure t
  :config
  (enable-theme 'dracula)
  (unless (display-graphic-p)
    (load-theme 'wombat))
  (custom-theme-set-faces 'dracula '(flyspell-duplicate ((t
                                                          (:weight bold
                                                                   :underline (:color "#0044ff"
                                                                                      :style wave)))))
                          '(flyspell-incorrect ((t
                                                 (:weight bold
                                                          :underline (:color "#00ff77"
                                                                             :style wave)))))))
