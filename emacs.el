(add-to-list 'load-path "~/elisp")

;; You're expected to populate elisp/local.el
;; with your own code. This file is under .gitignore
;; so it won't be version-controlled. The idea is to
;; make this file load other version-controlled files.
(load "anil")

(put 'downcase-region 'disabled nil)
