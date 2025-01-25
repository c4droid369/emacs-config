;; -*- lexical-binding: t -*-
(setup dired
  (:option dired-listing-switches "-agho --group-directories-first"
           dired-kill-when-opening-new-dired-buffer t)
  (put 'dired-find-alternative-file 'disabled nil))
(provide 'init-dired)
