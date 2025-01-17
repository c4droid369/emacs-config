;; -*- lexical-binding: t -*-
(setup (:straight gcmh)
  (:option gcmh-idle-delay 15
           gcmh-high-cons-threshold (* 16 1024 1024))
  (:hide-mode gcmh-mode)
  (gcmh-mode))
(provide 'init-performance)
