;; -*- lexical-binding: t -*-
(use-package gcmh
  :straight t
  :diminish
  :custom
  (gcmh-high-cons-threshold (* 128 1024 1024))
  :config
  (gcmh-mode))

(use-package benchmark-init
  :straight t
  :demand t
  :hook
  (after-init . benchmark-init/deactivate))
(provide 'init-performance)
