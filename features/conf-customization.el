;;====================================================================
;; theme
(load-theme 'wheatgrass)
(tool-bar-mode -1)
(menu-bar-mode -1)
(set-face-attribute 'default nil :height 110)


;;====================================================================
;; user defined command
(defun destroy-all-buffer ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))


;;====================================================================
(setq make-backup-files t)
(setq auto-save-default nil)

;; Set backup directory
(setq backup-directory-alist `(("." . "/tmp/.emacs.d/backups")))

;; Ensure the backup directory exists
(make-directory "/tmp/.emacs.d/backups" t)


;; disable the alert sound
(setq ring-bell-function 'ignore)

(provide 'conf-customization)
