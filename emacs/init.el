;; ==============================================================================
;; Emacs init config
;;
;; This file contains som initialization stuff we need before loading our config.
;; We need to get basic packaging support running in order to download org mode,
;; so we can load our config.org properly.
;; ==============================================================================

;; -----------------------------------------------------------------------
;; Enable Basic Packaging Support and Source Locations
(require 'package)

;; Add the Melpa archives to the list of available repositories
(add-to-list 'package-archives
            '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
            '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; -----------------------------------------------------------------------
;; Install use-package as our primary package manager
(package-initialize)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; -----------------------------------------------------------------------
;; Load the config file
(require 'org) ;; org is required for our configs
(setq vc-follow-symlinks t) ;; Always follow symlinks for git sources (like this file!)

;; TODO: we should split our config up into multiple modules to make things easier to read
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))




;; -----------------------------------------------------------------------
;; Random Shit Emacs Automatically Generates

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
