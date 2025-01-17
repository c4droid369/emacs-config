;; -*- lexical-binding: t -*-
(setup dired
  (:option dired-listing-switches "-agho --group-directories-first")
  (put 'dired-find-alternative-file 'disabled nil))
(provide 'init-dired)
