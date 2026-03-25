(use-package vterm
  :ensure t
  )

(use-package eat
  :ensure t
  )

(use-package ai-code
  :ensure (:host github :repo "tninja/ai-code-interface.el")
  :custom
  (ai-code-notifications-enabled t) ; Get feedback when AI finishes
  :config
  ; Switch the default terminal provider to agent-shell
  (ai-code-set-backend 'opencode)
  (setq ai-code-backends-infra-terminal-backend 'eat)
  )

(provide 'init-ai-code-interface)
