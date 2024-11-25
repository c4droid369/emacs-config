;; -*- lexical-binding: t -*-
(defvar current-distro (or (and (eq system-type 'gnu/linux)
								(file-exists-p "/etc/os-release")
								(with-temp-buffer
								  (insert-file-contents "/etc/os-release")
								  (search-forward-regexp "^ID=\"?\\(.*\\)\"?$")
								  (intern (or (match-string 1) "unknown"))))
						   'unknown))
(defvar is-guix-system? (eql current-distro 'guix))
(provide 'site-system)
