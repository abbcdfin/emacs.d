;;====================================================================
;; theme
(load-theme 'wheatgrass)

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

(provide 'conf-customization)
