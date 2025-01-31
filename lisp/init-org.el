;; -*- lexical-binding: t -*-
(use-package org
  :straight t
  :custom
  (org-log-done 'time)
  (org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "CANCELED(c@/!)")))
  (org-id-link-to-org-use-id t)
  (org-id-extra-files 'org-agenda-text-search-extra-files)
  :config
  (org-id-update-id-locations))

(use-package org-modern
  :straight t
  :after org
  :diminish global-org-modern-mode
  :config
  (global-org-modern-mode))

(use-package org-roam
  :straight t
  :custom
  (org-roam-directory (if is-win? "D:\\Documents\\Roam" "~/Note/Roam"))
  :config
  (org-roam-db-autosync-mode))
(provide 'init-org)
