(use-package aidermacs
  :ensure t
  :config
  ; Enable minor mode for Aider files
  (aidermacs-setup-minor-mode)

  :custom
  ; See the Configuration section below
  (aidermacs-auto-commits t)
  (aidermacs-default-chat-mode 'architect)
  (aidermacs-default-model "sonnet"))

(provide 'init-aidermacs)
