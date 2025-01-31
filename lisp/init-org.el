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
  (org-roam-completion-everywhere t)
  (org-roam-capture-template '(("d" "default" plain
                                "%?"
                                :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                                :unnarrowed t)))
  :config
  (org-roam-db-autosync-mode)
  (leader-def
    "n" '(:ignore t)
    "ni" 'org-roam-node-insert
    "nf" 'org-roam-node-find
    "nR" 'org-roam-node-random
    "nc" 'org-roam-capture
    "nr" 'org-roam-refile)
  (localleader-def
    :keymaps 'org-mode-map
    :major-modes t
    "n" '(:ignore t)
    "no" 'org-roam-node-open
    "nv" 'org-roam-node-visit))

(use-package org-roam-ui
  :straight t
  :after org-roam
  :diminish org-roam-ui-mode
  :custom
  (org-roam-ui-sync theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t)
  :config
  (localleader-def
    :keymaps 'org-mode-map
    :major-modes t
    "n" '(:ignore t)
    "nu" 'org-roam-ui-open))
(provide 'init-org)
