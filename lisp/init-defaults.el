;; -*- lexical-binding: t -*-
;; Basic completion
(setup completion
  (:option read-file-name-completion-ignore-case t
           read-buffer-completion-ignore-case t
           completion-ignore-case t))

;; UI
(setup user-interface
  (dolist (mode '(tool-bar-mode
                  meun-bar-mode
                  scroll-bar-mode
                  horizontal-scroll-bar-mode))
    (when (fboundp mode)
      (funcall mode -1)))

  (:option left-margin-width 2
           right-margin-width 2)
  (set-window-buffer nil (current-buffer))

  (add-to-list 'default-frame-alist '(internal-border-width . 8))
  (set-frame-parameter nil 'internal-border-width 8)

  (:require uniquify)
  (:option uniquify-buffer-name-style 'forward))

;; Save cursor last position
(setup save-place
  (save-place-mode))

;; Some default keybinding
(setup default-keybinding
  (:global "M-/" 'hippie-expand
           "C-x C-b" 'ibuffer
           "M-z" 'zap-up-to-char
           "C-s" isearch-forward-regexp
           "C-r" isearch-backward-regexp
           "C-M-s" 'isearch-forward
           "C-M-r" 'isearch-backward))

;; Show parens
(setup show-paren
  (show-paren-mode))

;; Tab
(setup tab
  (:option indent-tabs-mode nil))

;; Save history
(setup history
  (:option save-interprogram-paste-before-kill t)
  (savehist-mode))

;; Startup
(setup startup
  (:option inhibit-startup-screen t
           initial-scratch-message nil))

;; Use short answers
(setup short-answers
  (:option use-short-answers t))

;; Backup directory
(setup backup
  (:option backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))
           backup-by-copying t
           delete-old-versions t))

;; Kill whole line
(setup line
  (:option kill-whole-line t))

;; Scrolling
(setup scroll
  (:option scroll-step 1
           scroll-conservatively 10000
           mouse-wheel-follow-mouse t
           pixel-scroll-precision-use-momentum t))

;; Line number
(setup display-line-numbers
  (:hook-into prog-mode text-mode))

;; Visual line
(setup visual-line
  (:with-mode (text-mode prog-mode)
    (:hook visual-line-mode)))

;; Overwrite text when selected
(setup delsel
  (delete-selection-mode))

;; Misc
(setup misc
  (:option default-directory "~/"
           apropos-do-all t
           mouse-yank-at-point t
           require-final-newline nil
           ring-bell-function 'ignore
           visible-bell nil
           load-prefer-newer t
           frame-inhibit-implied-resize t
           ediff-window-setup-function 'ediff-setup-windows-plain
           create-lockfiles nil
           confirm-kill-processes nil
           line-spacing 1))

;; Set UTF-8 encoding
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(when is-win?
  (set-w32-system-coding-system 'utf-8))
(set-buffer-file-coding-system 'utf-8)

;; Keep config directory clean
(setup (:straight no-littering)
  (:require no-littering))
(provide 'init-defaults)
