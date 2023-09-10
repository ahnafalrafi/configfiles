;;; init.el --- -*- lexical-binding: t; -*-

;;; Code:

(setq user-full-name "Ahnaf Rafi")
(setq user-mail-address "ahnaf.al.rafi@gmail.com")

;; Set file for custom.el to use
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load custom-file 'noerror 'nomessage)

(provide 'init)
;;; init.el ends here
