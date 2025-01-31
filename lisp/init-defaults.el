;; -*- lexical-binding: t -*-
;; Basic completion
(setq read-file-name-completion-ignore-case t
      read-buffer-completion-ignore-case t
      completion-ignore-case t)

;; UI
(setq uniquify-buffer-name-style 'forward)
;; Disable extra UI
(dolist (mode '(tool-bar-mode
		menu-bar-mode
		scroll-bar-mode
		horizontal-scroll-bar-mode))
  (when (fboundp 'mode)
    (funcall mode nil)))

;; Save cursor last position
(save-place-mode)

;; Some default keybinding
(global-set-key (kbd "M-/") 'hipple-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Show parens
(show-paren-mode)

;; Tab
(setq-default indent-tabs-mode nil)

;; Save history
(setq-default save-interprogram-paste-before-kill t)
(savehist-mode)

;; Startup
(setq-default inhibit-startup-screen t
	      initial-scratch-message nil)

;; Use short answers
(setq use-short-answers t)

;; Backup directory
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory)))
      backup-by-copying t
      delete-old-versions t)

;; Kill whole line
(setq-default kill-whole-line t)

;; Scrolling
(setq scroll-step 1
      scroll-conservatively 10000
      mouse-wheel-follow-mouse t
      pixel-scroll-precision-use-momentum t)

;; Line number
(add-hook 'prog-mode 'display-line-numbers-mode)
(add-hook 'text-mode 'display-line-numbers-mode)

;; Visual line
(add-hook 'prog-mode 'visual-line-mode)
(add-hook 'text-mode 'visual-line-mode)

;; Overwrite text when selected
(delete-selection-mode)

;; Misc
(setq-default default-directory ""
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
	      line-spacing 1)

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
(use-package no-littering
  :straight t
  :demand t)
(provide 'init-defaults)
