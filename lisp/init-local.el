(load-theme 'wheatgrass)


(set-face-attribute 'default nil :height 121)
(setq org-format-latex-options '(:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                                             ("begin" "$1" "$" "$$" "\\(" "\\[")))

(setq c-default-style "linux")

(setq-default c-basic-offset 8
              tab-width 8)

(add-to-list 'c-mode-hook
             (lambda () (setq indent-tabs-mode t)))

(defun destroy-all-buffer ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(setq org-agenda-files (directory-files-recursively "~/org/org-normal" "\\.org$"))
(setq org-default-notes-file "~/org/org-normal/refile/refile.org")
;;(setq org-directory "~/org/org-normal")
;;(setq org-agenda-file-regexp "*.org")

(setq org-enable-priority-commands t)
(setq org-default-priority ?E)
(setq org-lowest-priority ?E)

(require 'package) (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;;(require 'ox-taskjuggler)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4))
(add-hook 'web-mode-hook 'my-web-mode-hook)

(add-hook 'web-mode-hook
          (lambda ()
            ;; short circuit js mode and just to do everything in jsx-mode
            (if (equal web-mode-content-type "javascript")
                (web-mode-set-content-type "jsx")
              (message "now set to: %s" web-mode-content-type))))

;; taking smart notes
(setq org-roam-v2-ack t)

;;(make-directory "~/workspace/org-roam")
(setq org-roam-directory (file-truename "~/org/org-roam"))
(org-roam-db-autosync-mode)

(autoload 'helm-bibtex "helm-bibtex" "" t)

(require 'org-ref)
(setq reftex-default-bibliography '("~/org/bib/jian.lib.bib" "~/org/bib/jian.calibre.bib"))
(setq bibtex-completion-bibliography '("~/org/bib/jian.lib.bib" "~/org/bib/jian.calibre.bib"))

(org-roam-mode)
(org-roam-bibtex-mode)

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

(require 'org-roam-bibtex)

(setq org-archive-location "~/org/archives/2024.org::* From %s")

;; yasnippet setup
(require 'yasnippet)
(yas/global-mode 1)

(provide 'init-local)

(setq org-image-actual-width nil)

;; latex/auctex
(defun compile-latex ()
  "complile latex of the current buffer"
  (setq web-mode-markup-indent-offset 4))
(setq TeX-parse-self t)

;; chinese input
(require 'pyim)
(require 'pyim-basedict)
(pyim-basedict-enable)
