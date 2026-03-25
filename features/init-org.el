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

;; org capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/org/org-normal/life.org")
(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline "" "FLEETING")
	 "* TODO %?\n %i\n %a")
	("n" "Note" entry (file+headline "" "FLEETING")
	 "* %? :NOTE:\n%U\n%a\n")
	))

;; 1. Refile Targets
;; 'nil' means "the current file you are working in"
;; ':maxlevel . 3' means "allow moving to headlines level 1, 2, or 3"
(setq org-refile-targets '((nil :maxlevel . 3)))

;; 2. Use full paths for refiling (Optional but highly recommended)
;; Instead of just showing "Startup", it shows "Projects/Startup"
;; This helps if you have multiple "Setup" tasks in different projects.
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)


;; org-agenda
;;(setq org-agenda-files (directory-files-recursively "~/org/org-normal" "\\.org$"))
(setq org-agenda-files '("~/org/org-normal/life.org"))
(setq org-todo-keywords
      '((sequence "TODO(t!)" "PROGRESSING(p!)" "PAUSED(q!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-log-into-drawer "LOGBOOK")


;; 
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

(setq orb-preformat-keywords '("title" "citekey"))
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
         (file+head "references/${citekey}.org" "#+title: ${title}\n")
         :unnarrowed t))
      )

(setq org-archive-location "~/org/archives/2026.org::* From %s")

(setq org-agenda-span 'day)

(provide 'init-org)
