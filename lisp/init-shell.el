;; -*- lexical-binding: t -*-
(use-package exec-path-from-shell
  :straight t
  :if (or is-linux? is-mac?)
  :init
  (exec-path-from-shell-initialize))
(provide 'init-shell)
