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
(require 'init-eshell)

;; System
(require 'init-shell)

;; Performance
(require 'init-performance)

;; Keybinding
(require 'init-vim)

;; Misc
(require 'init-misc)

;; Version control
(require 'init-git)

;; Programming
(require 'init-compilation)
(require 'init-completion)
(require 'init-eldoc)
(require 'init-parens)
(require 'init-helpful)

(require 'init-direnv)

(require 'init-elisp)
(require 'init-scheme)
(require 'init-haskell)
(require 'init-tintin)
(provide 'init)
