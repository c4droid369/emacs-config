;; -*- lexical-binding: t -*-
(setup (:straight evil)
  (:option evil-undo-system 'undo-redo
           evil-want-integration t
           evil-want-keybinding nil)
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
(provide 'init-vim)
