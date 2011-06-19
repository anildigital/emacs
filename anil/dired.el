; Dired
(require 'dired)

; - is `cd ..` (like vim)
(define-key dired-mode-map "-" 'dired-up-directory)

; prefer dired over dumping dir list to buffer
(global-set-key "\C-x\C-d" 'dired)