;; -*- lexical-binding: t -*-
(use-package evil
  :straight t
  :demand t
  :custom
  (evil-undo-system 'undo-redo)
  (evil-want-integration t)
  (evil-want-keybinding nil)
  (evil-want-minibuffer t)
  (evil-want-C-u-scroll t)
  (evil-want-Y-yank-to-eol t)
  (evil-split-window-below t)
  (evil-vsplit-window-right t)
  (evil-respect-visual-line-mode t)
  :init
  (evil-mode))

(use-package evil-collection
  :straight t
  :demand t
  :after evil
  :diminish evil-collection-unimpaired-mode
  :init
  (evil-collection-init))

(use-package evil-commentary
  :straight t
  :after evil
  :diminish
  :hook
  (prog-mode . evil-commentary-mode))

(use-package evil-surround
  :straight t
  :after evil
  :config
  (global-evil-surround-mode))

(use-package evil-org
  :straight t
  :after (evil org)
  :hook
  (org-mode . evil-org-mode)
  (evil-org-mode . evil-org-set-key-theme)
  :config
  (evil-org-agenda-set-keys))

(use-package general
  :straight t
  :config
  (general-evil-setup t)
  ;; Leader
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
  ;; Local leader
  (general-create-definer localleader-def
    :states '(normal motion emacs)
    :keymaps 'override
    :prefix "SPC m"
    :non-normal-prefix "C-SPC m")
  (localleader-def "" '(:ignore t :wk "mode")))
(provide 'init-vim)
