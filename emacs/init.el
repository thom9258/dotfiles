;; ==============================================================================
;; Emacs init config
;;
;; This file contains som initialization stuff we need before loading our config.
;; We need to get basic packaging support running in order to download org mode,
;; so we can load our config.org properly.
;; ==============================================================================


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
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package install 'use-package))
(setq use-package-always-ensure t)

;; Load the config file
(use-package org)
;;(setq config-root "~/.emacs.d/")
;;(org-babel-load-file (concat config-root "config.org"))
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
