(use-package dart-mode
  :ensure t
  :hook (dart-mode . (lambda ()
                       (lsp-deferred) ; or (eglot-ensure)
                       (flutter-test-mode))))

(use-package flutter
  :ensure t
  :after dart-mode
  :custom
  (flutter-sdk-path "~/opt/flutter/flutter") ; Adjust to your actual path
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload)))

(use-package lsp-dart
  :ensure t
  :after lsp-mode
  :custom
  (lsp-dart-flutter-sdk-dir "~/opt/flutter/flutter")) ; Adjust to your actual path

(provide 'init-flutter)
