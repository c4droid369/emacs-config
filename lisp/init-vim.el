;; -*- lexical-binding: t -*-
(setup (:straight evil)
  (:option evil-undo-system 'undo-redo
           evil-want-integration t
           evil-want-keybinding nil
           evil-want-minibuffer t
           evil-want-C-u-scroll t
           evil-want-Y-yank-to-eol t
           evil-split-window-below t
           evil-vsplit-window-right t
           evil-respect-visual-line-mode t)
  (evil-mode))

(setup (:straight evil-collection)
  (:load-after evil)
  (evil-collection-init)
  (:hide-mode evil-collection-unimpaired-mode))

(setup (:straight evil-commentary)
  (:load-after evil)
  (:hide-mode evil-commentary-mode)
  (:hook-into prog-mode))

(setup (:straight evil-surround)
  (:load-after evil)
  (global-evil-surround-mode))

(setup (:straight evil-org)
  (:load-after evil org)
  (:hook-into org-mode)
  (:with-mode evil-org-mode
    (:hook evil-org-set-key-theme))
  (:require evil-org-agenda)
  (evil-org-agenda-set-keys))

(setup (:straight general)
  (general-evil-setup t)

  (general-create-definer leader-def
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :non-normal-prefix "C-SPC")
  (leader-def
    "" '(:ignore t :wk "leader")
    "f" '(:ignore t :wk "file")
    "c" '(:ignore t :wk "checks")
    "t" '(:ignore t :wk "toggle")
    "b" '(:ignore t :wk "buffer")
    "bd" 'kill-this-buffer
    "bn" 'next-buffer
    "bp" 'previous-buffer
    "bx" 'kill-buffer-and-window
    "s" '(:ignore t :wk "straight")
    "sf" 'straight-x-fetch-all
    "sp" 'straight-x-pull-all
    "sr" 'straight-remove-unused-repos
    "ss" 'straight-get-recipe)
  
  (general-create-definer localleader-def
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC m"
    :non-normal-prefix "C-SPC m")
  (localleader-def "" '(:ignore t :wk "mode")))
(provide 'init-vim)
