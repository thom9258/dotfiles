;; ============================================================================
;; Emacs Config
;; Thomas Alexgaard Jensen (gitlab.com/alexgaard)
;; ============================================================================

;; ============================================================================
;; Setup Emacs server
;; ============================================================================
(load "server")
(unless (server-running-p) (server-start))

;; define function to shutdown emacs server instance
(defun server-stop ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )

;; ============================================================================
;; Emacs Config Loader
;; ============================================================================
(setq config-root "~/.config/emacs/")

(defun load-config-module (path)
  "Load config module from default config path defined by <config-root>"
  (interactive)
  (when (file-exists-p (concat config-root path))
    (load-file (concat config-root path)))
  )

(defun reload-config ()
  "Reload entire config (meant to be used on emacs server if config is changed)"
  (interactive)
  (load-file (concat config-root "config.el"))
  )

(load-config-module "modules/basics.el")
(load-config-module "modules/package_management.el")
(load-config-module "modules/evil_config.el")
(load-config-module "modules/org_config.el")
(load-config-module "modules/pdf_config.el")
(load-config-module "modules/ide.el")
