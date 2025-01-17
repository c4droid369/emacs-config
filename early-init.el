;; -*- lexical-binding: t -*-
;; Suppression startup speed
(setq byte-compile-warnings '(not obsolete)
      warning-suppress-log-types '((comp) (bytecomp))
      native-comp-async-report-warnings-errors 'silent)

;; Defer compilation
(defvar comp-deferred-compilation)
(setq comp-deferred-compilation t)

;; Low haniging speedup fruits
(setq package-enable-at-startup nil
      frame-inhibit-implied-resize t)

;; Disable UI components
(dolist (mode '(tool-bar-mode
		menu-bar-mode
		scroll-bar-mode))
  (if (fboundp mode)
      (funcall mode -1)))

;; Straight
(setq straight-cache-autoloads t
      straight-vc-git-default-clone-depth 1
      straight-check-for-modifications '(find-when-checking))

;; Setup
;; ()

;; Debug when encounting error
(setq debug-on-error t)
(provide 'early-init)
