(defun color-theme-njs-wheat ()
  "Color theme by Nick Sieger [01/01/09 15:34 NJS] derived from
'wheat'."
  (interactive)
  (color-theme-wheat)
  (color-theme-install
   '(color-theme-njs-wheat
     ((background-color . "#dfdbc3")
      (foreground-color . "#3b2322")
      (cursor-color . "spring green"))
     ((buffers-tab-face . buffers-tab)
      (cperl-here-face . font-lock-string-face)
      (cperl-invalid-face quote underline)
      (cperl-pod-face . font-lock-comment-face)
      (cperl-pod-head-face . font-lock-variable-name-face)
      (vc-mode-face . highlight))
     (fringe ((t (:background "#e8e4cc"))))
     (font-lock-comment-face ((t (:foreground "AntiqueWhite4"))))
     (jde-java-font-lock-javadoc-face ((t (:foreground "AntiqueWhite4"))))
     (font-lock-string-face ((t (:foreground "SaddleBrown"))))
     (font-lock-variable-name-face ((t (:foreground "goldenrod3"))))
     (mode-line ((t (:background "#7f2a19" :foreground "white"))))
     (mode-line-buffer-id ((t (:background "#7f2a19" :foreground "white"))))
     (trailing-whitespace ((t (:underline t)))))))
