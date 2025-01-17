;; -*- lexical-binding: t -*-
;; Bootstrap code
(add-to-list 'load-path (expand-file-name "bootstrap" user-emacs-directory))
(require 'bootstrap-straight)
(require 'bootstrap-setup)

;; Helper library
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; Performance
(require 'site-benchmarking)

;; System
(require 'site-system)

;; Package manager
(require 'site-setup)

;; Plugin
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Emacs internal
(require 'init-defaults)
(require 'init-dired)

;; System
(require 'init-shell)

;; Misc
(require 'init-misc)

;; Performance
(require 'init-performance)

;; Keybinding
(require 'init-vim)

;; Version control
(require 'init-git)

;; Programming
(require 'init-completion)
(require 'init-eldoc)
(require 'init-parens)

(require 'init-direnv)

(require 'init-scheme)
(require 'init-haskell)
(require 'init-tintin)

(provide 'init)
