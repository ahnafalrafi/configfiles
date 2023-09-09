;;; early-init.el --- -*- lexical-binding: t; -*-

;;; Code:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Get rid of splash screen
(setq inhibit-splash-screen t)
(setq inhibit-startup-echo-area-message user-login-name) ;; read the docstring
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu nil)
(setq initial-scratch-message nil)
(advice-add #'display-startup-echo-area-message :override #'ignore)

;; Use straight.el for package management.
(setq package-enable-at-startup nil)

(setq gc-cons-threshold (* 50 1024 1024))

(setq read-process-output-max (* 1024 1024)) ;; 1mb

(setq frame-inhibit-implied-resize t)

;; yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Native Compilation warnings are really annoying. Let's suppress them.
(setq native-comp-async-report-warnings-errors nil)
(when (eq system-type 'darwin)
  (setq native-comp-driver-options '("-Wl,-w")))

;; Clipboard/kill-ring --- do not keep duplicates.
(setq kill-do-not-save-duplicates t)

;; Disable the alarm bell
(setq ring-bell-function 'ignore)

;; For mouse events
(setq use-dialog-box nil)
(setq use-file-dialog nil)

;; Disable backups and lockfiles
(setq make-backup-files nil)
(setq create-lockfiles nil)

;; Enable auto-saves
(setq auto-save-default t)

;; Auto-save transforms
(setq auto-save-file-name-transforms
      (list (list "\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'"
                  ; Prefix tramp auto-saves to prevent conflicts
                  (concat auto-save-list-file-prefix "tramp-\\2") t)
            (list ".*" auto-save-list-file-prefix t)))

;; Profile Emacs startup time and amount of garbage collection.
(add-hook
 'emacs-startup-hook
 (lambda ()
   (message "*** Emacs loaded in %s seconds with %d garbage collections."
            (emacs-init-time "%.2f")
            gcs-done)))

(provide 'early-init)
;;; early-init.el ends here
