;; -*- lexical-binding: t -*-
(setup elisp-mode
  (localleader-def
    :keymaps 'emacs-lisp-mode-map
    :major-modes t
    "e" '(:ignore t :wk "eval")
    "ee" 'eval-defun
    "es" 'eval-last-sexp
    "eb" 'eval-buffer
    "er" 'eval-region))
(provide 'init-elisp)
