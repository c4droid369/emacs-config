;; -*- lexical-binding: t -*-
;; Bootstrap code
(add-to-list 'load-path (expand-file-name "bootstrap" user-emacs-directory))
(require 'bootstrap-straight)

;; Helper library
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; System
(require 'site-system)

;; Plugin
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Emacs internal
(require 'init-defaults)

;; Programming
(require 'init-scheme)
(require 'init-tintin)
