;; -*- lexical-binding: t -*-
(use-package elisp-mode
  :straight (:type built-in)
  :config
  (localleader-def
    :keymaps 'emacs-lisp-mode-map
    :major-modes t
    "e" '(:ignore t)
    "ee" 'eval-defun
    "es" 'eval-last-sexp
    "eb" 'eval-buffer
    "er" 'eval-region))
(provide 'init-elisp)
