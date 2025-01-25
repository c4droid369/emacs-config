;; -*- lexical-binding: t -*-
(setup (:straight magit)
  (:hide-mode global-auto-revert-mode)
  (leader-def
    "g" '(:ignore t :wk "git")
    "gs" '(magit-status :wk "git status"))
  (dir-locals-set-class-variables 'huge-git-repository '((magit-status-mode . ((eval . (magit-disable-section-inserter 'magit-insert-tags-header)))))))
(provide 'init-git)
