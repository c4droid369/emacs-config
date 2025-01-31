;; -*- lexical-binding: t -*-
(use-package dired
  :straight (:type built-in)
  :custom
  (dired-listing-switches "-agho --group-directories-first")
  (dired-kill-when-opening-new-dired-buffer t)
  :config
  (put 'dired-find-alternative-file 'disabled nil))
(provide 'init-dired)
