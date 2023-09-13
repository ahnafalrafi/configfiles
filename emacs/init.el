;;; init.el --- -*- lexical-binding: t; -*-

;;; Code:

;; Name and email.
(setq user-full-name "Ahnaf Rafi")
(setq user-mail-address "ahnaf.al.rafi@gmail.com")

;; Set file for custom.el to use --- I use this for temporary customizations.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; Load the custom file.
(load custom-file 'noerror 'nomessage)

;; Add user lisp directory to load path.
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package if not present.
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)
