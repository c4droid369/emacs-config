;; -*- lexical-binding: t -*-
(require 'setup)

;; Protect call setup macro
(add-to-list 'setup-modifier-list 'setup-wrap-to-demote-errors)

;; General macro definer
(defmacro defsetup (name signature &rest body)
  "Shorthand for `setup-define'.

NAME is the name of the local macro.  SIGNATURE is used as the
argument list for FN.  If BODY starts with a string, use this as
the value for :documentation.  Any following keywords are passed
as OPTS to `setup-define'."
  (declare (debug defun)
           (indent defun))
  (let (opts)
    (when (stringp (car body))
      (setq opts (nconc (list :documentation (pop body))
                        opts)))
    (while (keywordp (car body))
      (let* ((prop (pop body))
             (val `',(pop body)))
        (setq opts (nconc (list prop val) opts))))
    `(setup-define ,name
       (cl-function (lambda ,signature ,@body))
       ,@opts)))

;; Straight
(defsetup :straight (recipe)
  "Install RECIPE with `straight-use-package'.

This macro can be used as HEAD, and will replace itself with the
first RECIPE's package."
  :repeatable t
  :shorthand (lambda (sexp)
               (let ((recipe (cadr sexp)))
                 (if (consp recipe)
                     (car recipe)
                   recipe)))
  `(unless (straight-use-package ',recipe)
     ,(setup-quit)))

(defsetup :straight-when (recipe condition)
  "Install RECIPE with `straight-use-package' when CONDITION is met.

If CONDITION is false, stop evaluating the body.  This macro can be
used as HEAD, and will replace itself with the RECIPE's package.
This macro is not repeatable."
  :repeatable nil
  :indent 1
  :shorthand (lambda (sexp)
               (let ((recipe (cadr sexp)))
                 (if (consp recipe)
                     (car recipe)
                   recipe)))
  `(if ,condition
       (straight-use-package ',recipe)
     ,(setup-quit)))

;; Deferred loading
(defsetup :load-after (&rest features)
  "Load the current feature after FEATURES."
  (let ((body `(require ',(setup-get 'feature))))
    (dolist (feature (nreverse features))
      (setq body `(with-eval-after-load ',feature ,body)))
    body))

;; Load from load-path
(defsetup :load-from (path)
  "Add PATH to load path.

This keyword can be used as NAME, and it will replace itself
with the nondirectory part of PATH.
If PATH does not exist, abort the evaluation."
  :shorthard (lambda (args)
               (intern (file-name-nondirectory (directory-file-name (cadr args)))))
  `(let ((path* (expand-file-name ,path)))
     (if (file-exists-p path*)
         (add-to-list 'load-path path*)
       ,(setup-quit))))

;; Remove the specific mode line lighter
(defsetup :hide-mode (&optional mode)
  "Hide the mode-line lighter of the current mode.

Alternatively, MODE can be specified manually, and override the
current mode."
  :after-loaded t
  (let* ((mode (or mode (setup-get 'mode)))
         (mode (if (string-match-p "-mode\\'" (symbol-name mode))
                   mode
                 (intern (format "%s-mode" mode)))))
    `(setq minor-mode-alist
           (delq (assq ',mode minor-mode-alist) minor-mode-alist))))
(provide 'site-setup)
