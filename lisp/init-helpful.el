;; -*- lexical-binding: t -*-
(setup (:straight helpful)
  (leader-def
    "h" '(:ignore t :wk "help")
    "hh" 'helpful-symbol
    "hf" 'helpful-function
    "hv" 'helpful-variable
    "hv" 'helpful-key
    "ho" 'helpful-at-point)
  (add-to-list 'display-buffer-alist
               '("*[Hh]elp"
                 (display-buffer-reuse-mode-window
                  display-buffer-pop-up-window))))
(provide 'init-helpful)
