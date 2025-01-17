;; -*- lexical-binding: t -*-
;; Inhibit startup screen
(setq-default inhibit-startup-screen t)

;; Use short answers
(defalias 'yes-or-no-p 'y-or-n-p)

;; Backup directory
(setq backup-directory-alist `(("." . ,(expand-file-name "backups" user-emacs-directory))))

;; Kill whole line
(setq kill-whole-line t)

;; Tab
(setq-default indent-tabs-mode nil
              tab-width 4
              standard-indent 4
              lisp-indent-offset nil
              sgml-basic-offset 4
              electric-indent-inhibit nil)
(setq backward-delete-char-untabify-method 'nil)
(electric-indent-mode nil)

;; Scrolling
(setq scroll-step 1
      scroll-conservatively 10000)

;; Parens pair
(electric-pair-mode t)

;; Line number
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

;; Visual line
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'visual-line-mode)
(provide 'init-defaults)
