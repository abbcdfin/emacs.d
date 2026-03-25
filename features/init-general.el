(use-package orderless
  :ensure t
  :custom
  ;; This tells Emacs to use orderless for everything
  (completion-styles '(orderless basic))
  ;; Optional: This allows for better file path completion
  (completion-category-overrides '((file (styles basic partial-completion))))
  ;; Make sure completion is case-insensitive
  (read-file-name-completion-ignore-case t)
  (read-buffer-completion-ignore-case t)
  (completion-ignore-case t))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(provide 'init-general)
