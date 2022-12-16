;; ============================================================================
;; Package Management
;; ============================================================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archives to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; Download use-package to handle our packages instead of package-install
(unless (package-installed-p ' use-package)
  (package-refresh-contents)
  (package install 'use-package))
(setq use-package-always-ensure t)

(use-package better-defaults)

;; ============================================================================
;; Themes
;; ============================================================================

;;(use-package material-theme)
;;(load-theme 'material t)
(package-install 'monokai-theme)
(load-theme 'monokai t)

;; ============================================================================
;; UI
;; ============================================================================

(package-install 'neotree)
