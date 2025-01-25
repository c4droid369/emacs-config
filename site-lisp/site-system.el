;; -*- lexical-binding: t -*-
;; General system predicate
(defvar is-linux? (eq system-type 'gnu/linux))

(defvar is-mac? (eq system-type 'darwin))

(defvar is-win? (eq system-type 'windows-nt))

;; Specific linux distro
(defvar current-distro (or (and (eq system-type 'gnu/linux)
								(file-exists-p "/etc/os-release")
								(with-temp-buffer
								  (insert-file-contents "/etc/os-release")
								  (search-forward-regexp "^ID=\"?\\(.*\\)\"?$")
								  (intern (or (match-string 1) "unknown"))))
						   'unknown))

;; GNU Guix System
(defvar is-guix-system? (eql current-distro 'guix))
(provide 'site-system)
