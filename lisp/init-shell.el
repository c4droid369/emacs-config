;; -*- lexical-binding: t -*-
(setup (:straight-when exec-path-from-shell (or is-linux? is-mac?))
  (exec-path-from-shell-initialize))
(provide 'init-shell)
