(use-package ggtags
  :ensure t
  :hook (prog-mode . ggtags-mode)
  :config
  (setq ggtags-mode-line-project-display t)
  (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
  (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
  (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
  (define-key ggtags-mode-map (kbd "C-c g d") 'ggtags-find-definition))

(provide 'init-coding)
