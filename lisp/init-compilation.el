;; -*- lexical-binding: t -*-
(setup compile
  (:with-hook compilation-filter-hook
    (:hook ansi-color-compilation-filter)))
(provide 'init-compilation)
