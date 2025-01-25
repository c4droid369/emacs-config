;; -*- lexical-binding: t -*-
(setup (:straight fn))

(setup (:straight s))

(setup (:straight f))

(setup (:straight ht))

(setup (:straight dash))

(setup (:straight a))

(setup (:straight ts))

(setup (:straight pcre2el))

(setup (:straight hierarchy))

(setup (:straight restart-emacs)
  (defun local/reload-init ()
    "Reload `user-init-file'."
    (interactive)
    (message (format "Reloading %s..." user-init-file))
    (load user-init-file nil 'nomessage)
    (message (format "Reloading %s... done." user-init-file)))
  
  (leader-def
    "q" '(:ignore t :wk "exit emacs")
    "qR" 'restart-emacs
    "qn" 'restart-emacs-start-new-emacs
    "qr" 'local/reload-init))
(provide 'init-misc)
