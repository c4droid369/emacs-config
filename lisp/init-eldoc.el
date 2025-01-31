;; -*- lexical-binding: t -*-
(use-package eldoc
  :straight (:type built-in)
  :diminish)

(use-package eldoc-box
  :straight t
  :after eldoc
  :diminish eldoc-box-hover-at-point-mode
  :custom
  (eldoc-box-only-multi-line t)
  :hook
  (eldoc-mode . eldoc-box-hover-at-point-mode))

(use-package eldoc-overlay
  :straight t
  :hook
  (eldoc-mode . eldoc-overlay-mode))
(provide 'init-eldoc)
