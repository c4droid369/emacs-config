;; -*- lexical-binding: t -*-
(setup eshell
  (:require em-smart)
  (:option eshell-where-to-jump 'begin
           eshell-review-quick-commands nil
           eshell-smart-space-goes-to-end t))

(setup (:straight eshell-syntax-highlighting)
  (eshell-syntax-highlighting-global-mode))

(setup (:straight '(eat :type git
                        :host codeberg
                        :repo "akib/emacs-eat"
                        :files ("*.el" ("term" "term/*.el") "*.texi"
                                "*.ti" ("terminfo/e" "terminfo/e/*")
                                ("terminfo/65" "terminfo/65/*")
                                ("integration" "integration/*")
                                (:exclude ".dir-locals.el" "*-tests.el"))))
  (:with-hook eshell-load-hook
    (:hook eat-eshell-mode eat-eshell-visual-command-mode)))
(provide 'init-eshell)
