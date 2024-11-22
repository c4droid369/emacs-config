;; -*- lexical-binding: t -*-
;; Bootstrap code
(add-to-list 'load-path (expand-file-name "bootstrap" user-emacs-directory))
(require 'bootstrap-straight)

;; Plugin
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Emacs internal
(require 'init-defaults)

;; Programming
(require 'init-tintin)
