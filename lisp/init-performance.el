;; -*- lexical-binding: t -*-
(setup (:straight gcmh)
  (:option gcmh-high-cons-threshold (* 128 1024 1024))
  (:hide-mode gcmh-mode)
  (gcmh-mode))

(setup (:straight esup))
(provide 'init-performance)
