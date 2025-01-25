;; -*- lexical-binding: t -*-
;; Defer compilation
(defvar comp-deferred-compilation)
(setq comp-deferred-compilation t)

;; Low haniging speedup fruits
(setq package-enable-at-startup nil
      frame-inhibit-implied-resize t)

;; Disable UI components
(dolist (mode '(tool-bar-mode
		        menu-bar-mode
		        scroll-bar-mode
                horizontal-scroll-bar-mode))
  (when (fboundp mode)
    (funcall mode -1)))

;; Reduce GC
(defvar local/gc-cons-threshold (* 16 1024 1024))
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-thershold local/gc-cons-threshold
                  gc-cons-percentage 0.1)))

(defun local/defer-garbage-collection ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun local/restore-garbage-collection ()
  (run-at-time
   1 nil (lambda ()
           (setq gc-cons-threshold local/gc-cons-threshold))))

(add-hook 'minibuffer-setup-hook #'local/defer-garbage-collection)
(add-hook 'minibuffer-exit-hook #'local/restore-garbage-collection)
(setq garbage-collection-messages t)

;; Temporarily avoid special handling of files
(defvar local/file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist local/file-name-handler-alist)))

;; Disable site-run-file
(setq site-run-file nil)

;; Don't compact font caches
(setq inhibit-compacting-font-caches t)

;; Improve I/O
(when (boundp 'read-process-output-max)
  (setq read-process-output-max (* 1024 1024)))

;; Straight
(setq straight-cache-autoloads t
      straight-vc-git-default-clone-depth 1
      straight-check-for-modifications '(find-when-checking))

;; Debug when encounting error
(setq debug-on-error t)

;; Suppression startup speed
(setq byte-compile-warnings '(not obsolete)
      warning-suppress-log-types '((comp) (bytecomp))
      native-comp-async-report-warnings-errors 'silent)

;; Benchmarking
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds" (float-time
                                             (time-subtract after-init-time before-init-time)))
                     gcs-done)))
(provide 'early-init)
