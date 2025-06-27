;; --- gptel Configuration with Elpaca ---
;; This section installs and configures the gptel package.
;; Add your custom recipe to elpaca-recipe-alist
(use-package transient
  :ensure t
  :config
  ;; ...
  )

(use-package gptel
  ;; :elpaca t tells use-package to install this package using Elpaca
  ;; If you set (elpaca-use-package-mode) above, :elpaca t is often optional,
  ;; but it's good practice for clarity.
  :ensure (:host github :repo "karthink/gptel" :branch "master")

  ;; :defer t means the package will be loaded lazily,
  ;; only when one of its commands is called. This speeds up Emacs startup.
  :defer t

  ;; :init is run before the package is loaded.
  ;; Use this for settings that need to be in place early.
  :init
  (progn
    (setq gptel-backend
          (gptel-make-deepseek "deepseek-r1"
            :host "dashscope.aliyuncs.com/compatible-mode"
            :models '("deepseek-r1-0528")
            :stream t
            :key "sk-6130d0bbfcb7411fb3fbe483ee6e7126"))

    (setq-default gptel-model 'deepseek-r1-0528)

    (setq-default gptel-include-reasoning t)

    (setq gptel-log-level 'debug)
    )

  ;; :config is run after the package has been loaded.
  ;; Use this for settings that depend on the package being fully loaded.
  :config
  (progn
    ;; Optional: Bind a global key to open gptel.
    ;; C-c g g is a common binding for AI-related commands.
    ;;(global-set-key (kbd "C-c g g") 'gptel)

    ;; Optional: Configure how gptel displays its output.
    ;; For example, to use a separate window instead of a new buffer in current window.
    ;; (setq gptel-display-buffer-action '(display-buffer-at-bottom . ((window-height . 0.3))))

    ;; Add any other gptel specific configurations here.
    ;; Refer to gptel's documentation for more options (M-x describe-function gptel RET)
    ;; or its GitHub page.
    )
  )

(provide 'init-gptel)
