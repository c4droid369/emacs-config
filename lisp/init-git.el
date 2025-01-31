;; -*- lexical-binding: t -*-
(use-package magit
  :straight t
  :diminish auto-revert-mode
  :config
  (leader-def
    "g" '(:ignore t)
    "gs" 'magit-status)
  (dir-locals-set-class-variables 'huge-git-repository
                                  '((magit-status-mode . ((eval . (magit-disable-section-inserter 'magit-insert-tags-header)))))))
(provide 'init-git)
