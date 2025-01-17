;; -*- lexical-binding: t -*-
(setup (:straight evil)
  (:option evil-undo-system 'undo-redo
           evil-want-integration t
           evil-want-keybinding nil
           evil-want-minibuffer t)
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

;; Free modifier key
(setup (:straight god-mode)
  (:option god-exempt-predicates nil
           god-exempt-major-modes nil)
  (:hide-mode god-mode))

(setup (:straight evil-god-state)
  (:load-after god-mode evil)
  (evil-define-key 'normal global-map (kbd "SPC") 'evil-execute-in-god-state)
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail))
(provide 'init-vim)
