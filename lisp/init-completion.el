;; -*- lexical-binding: t -*-
;; Command
(setup (:straight consult)
  (:require consult)
  (:global "C-x b" consult-buffer
           "M-y" consult-yank-pop
           "M-s r" consult-ripgrep
           "M-s l" consult-line
           "M-s s" consult-line
           "M-s L" consult-line-multi
           "M-s o" consult-outline)
  (:option consult-narrow-key "<"))

(setup (:straight embark)
  (:global "C-c a" embark-act))

(setup (:straight embark-consult)
  (:load-after embark consult))

;; Minibuffer
(setup (:straight vertico)
  (:require vertico-directory)
  (:option vertico-cycle t
           vertico-resize t)
  (vertico-mode))

(setup (:straight marginalia)
  (marginalia-mode))

(setup (:straight orderless))

;; General completion style
(setup (:straight marginalia)
  (:option completion-styles '(orderless partial-completion basic)
           completion-cateogry-overrides '((file (styles basic partial-completion)))))

;; Code completion
(setup (:straight corfu)
  (:require corfu corfu-popupinfo)
  (:hook-into prog-mode)
  (:with-mode corfu-mode
    (:hook corfu-popupinfo-mode))
  (:option corfu-auto t
           corfu-auto-prefix 3
           corfu-auto-delay 0
           corfu-echo-documentation 0
           corfu-preview-current nil
           corfu-quit-no-match 'separator
           corfu-separator ?\s)
  ;; popupinfo
  (:option corfu-popupinfo-delay '(0.25 . 0.1)
           corfu-popupinfo-hide nil)
  (:with-feature minibuffer
    (defun corfu-enable-always-in-minibuffer ()
      "Enable `corfu' in the minibuffer if `vertico' is not active.

Useful for prompts such as `eval-expression' and `shell-command'."
      (unless (bound-and-true-p vertico--input)
        (corfu-mode 1)))
    (:with-hook minibuffer-setup-hook
      (corfu-enable-always-in-minibuffer))))

(setup (:straight-when corfu-terminal (not (display-graphic-p)))
  (:hook-into corfu-mode))

(setup (:straight cape)
  (dolist (backend '(cape-keyword cape-file cape-dabbrev))
    (add-to-list 'completion-at-point-functions backend)))

(setup (:straight-when kind-icon (display-graphic-p))
  (:load-after corfu)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
(provide 'init-completion)
