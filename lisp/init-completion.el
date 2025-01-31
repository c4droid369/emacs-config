;; -*- lexical-binding: t -*-
;; Completion style
(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless initials basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (orderless-matching-styles '(orderless-regexp orderless-initialism orderless-literal))
  (orderless-style-dispatchers '(orderless-affix-dispatch orderless-kwd-dispatch)))

;; `completing-read' completion
(use-package consult
  :straight t
  :custom
  (consult-narrow-key "C-.")
  :hook
  (completion-list-mode . consult-preview-at-point-mode)
  :bind
  (([remap switch-to-buffer] . consult-buffer)
   ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
   ([remap switch-to-buffer-other-frame] . consult-buffer-other-frame)
   ([remap bookmark-jump] . consult-bookmark)
   ([remap goto-line] . consult-goto-line)
   ([remap imenu] . consult-imenu)
   ([remap multi-occur] . consult-line-multi)
   ([remap recentf-open-files] . consult-recent-file)
   ([remap yank-pop] . consult-yank-replace)
   ("C-s" . consult-line)
   ("C-S-s" . (lambda ()
                (interactive)
                (consult-line (thing-at-point 'symbol))))))

(use-package consult-dir
  :straight t
  :after consult
  :bind
  (("C-x C-d" . consult-dir)
   :map minibuffer-local-completion-map
   ("C-x C-d" . consult-dir)
   ("C-x C-j" . consult-dir-jump-file)))

;; Minibuffer completion
(use-package vertico
  :straight t
  :bind
  (:map vertico-map
        ("M-DEL" . vertico-directory-delete-word))
  :hook
  (minibuffer-setup . vertico-repeat-save)
  :config
  (vertico-mode))

;; Minibuffer action
(use-package embark
  :straight t
  :bind
  (("C-," . embark-dwim)
   ([remap describe-bindings] . embark-bindings)))

(use-package embark-consult
  :straight t
  :after (consult embark)
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

;; Minibuffer enhance
(use-package marginalia
  :straight t
  :bind
  (:map minibuffer-local-map
        ("M-a" . marginalia-cycle))
  :config
  (marginalia-mode))

;; Code
(use-package corfu
  :straight t
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-preselect-first nil)
  (corfu-preview-current nil)
  (corfu-quit-no-match 'separator)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0)
  (corfu-echo-documentation 1)
  :hook
  (prog-mode . corfu-mode)
  (corfu-mode . corfu-popupinfo-mode))

(use-package corfu-terminal
  :straight t
  :after corfu
  :if (not (display-graphic-p))
  :hook
  (corfu-mode . corfu-terminal-mode))

(use-package cape
  :straight t
  :bind-keymap
  ("C-c p" . cape-prefix-map)
  :hook
  (completion-at-point-functions . (lambda ()
                                     (cape-dabbrev)
                                     (cape-file)
                                     (cape-elisp-block))))
(provide 'init-completion)
