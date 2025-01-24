;; -*- lexical-binding: t -*-
;; Basic completion
(setup (:straight ivy)
  (:hide-mode ivy-mode)
  (:option ivy-use-virtual-buffers t
           ivy-count-format "%d/%d "
           ivy-height 10
           ivy-initial-input-alist nil
           ivy-re-builders-alist '((t . ivy--regex-ignore-order))
           enable-recursive-minibuffers t)
  (ivy-mode 1))

(setup (:straight counsel)
  (:load-after ivy)
  (:hide-mode counsel-mode)
  (counsel-mode 1))

(setup (:straight swiper)
  (:load-after ivy)
  (swiper-mode 1))

;; Code
(setup (:straight company)
  (:hook-into prog-mode)
  (:hide-mode company-mode)
  (:option company-minimum-prefix-length 2
           company-idle-delay 0))
(provide 'init-completion)
