;; -*- lexical-binding: t -*-
(use-package direnv
  :straight t
  :if (executable-find "direnv")
  :config
  (direnv-mode))
(provide 'init-direnv)
