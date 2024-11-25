;; -*- lexical-binding: t -*-
;; Use short answers
(defalias 'yes-or-no-p 'y-or-n-p)

;; Backup directory
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))

;; Kill whole line
(setq kill-whole-line t)

;; Tab
(setq-default indent-tabs-mode nil)

;; Parens pair
(electric-pair-mode t)
(provide 'init-defaults)
