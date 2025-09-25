;;
(use-package org
  :ensure t)
(use-package org-roam
  :ensure t)
(use-package helm-bibtex
  :ensure t)
(use-package org-contrib
  :ensure t)
(use-package org-ref
  :ensure t)
(use-package org-roam-bibtex
  :ensure t
  :after org-roam
  :config
  (org-roam-bibtex-mode))

;;

;; customisation
(setq org-agenda-files (directory-files-recursively "~/org/org-normal" "\\.org$"))
(setq org-default-notes-file "~/org/org-normal/refile/refile.org")

(setq org-enable-priority-commands t)
(setq org-default-priority ?E)
(setq org-lowest-priority ?E)

;; taking smart notes
(setq org-roam-v2-ack t)

;;(make-directory "~/workspace/org-roam")
(setq org-roam-directory (file-truename "~/org/org-roam"))
;;(org-roam-db-autosync-mode)

(setq reftex-default-bibliography '("~/org/bib/jian.zotero.bib" "~/org/bib/jian.calibre.bib"))
(setq bibtex-completion-bibliography '("~/org/bib/jian.zotero.bib" "~/org/bib/jian.calibre.bib"))

;;(org-roam-mode)

(setq orb-preformat-keywords '("shorttitle" "citekey"))
(setq org-roam-capture-templates
      '(;; ... other templates
        ;; default template
        ("d" "default" plain "%?"
         :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n")
         :unnarrowed t)
        ;; bibliography note template
        ("r" "bibliography reference" plain "%?"
         :if-new
         (file+head "references/${citekey}.org" "#+title: ${shorttitle}\n")
         :unnarrowed t))
      )

(setq org-archive-location "~/org/archives/2025.org::* From %s")

(provide 'init-org)
