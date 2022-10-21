(use-package
  hydra
  :ensure t
  :bind ("C-c c" . hydra-clock/body))

(defhydra hydra-clock
  (:color blue)
  "
    ^
    ^Clock^             ^Do^
    ^─────^─────────────^──^─────────
    _q_ quit            _c_ cancel
    ^^                  _d_ display
    ^^                  _e_ effort
    ^^                  _i_ in
    ^^                  _j_ jump
    ^^                  _o_ out
    ^^                  _r_ report
    ^^                  ^^
    " ("q" nil)
    ("c" org-clock-cancel
     :color pink)
    ("d" org-clock-display)
    ("e" org-clock-modify-effort-estimate)
    ("i" org-clock-in)
    ("j" org-clock-goto)
    ("o" org-clock-out)
    ("r" org-clock-report))
