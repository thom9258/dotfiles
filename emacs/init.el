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
;;(add-to-list 'package-archives
;;            '("melpa" . "http://melpa.org/packages/") t)
;;(add-to-list 'package-archives
;;            '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ;;("melpa-stable" . "https://stable.melpa.org/packages/")
                         ))
(package-initialize)


;; Load the config file
(require 'org)
;; Always follow symlinks for git sources (like this file!)
(setq vc-follow-symlinks t)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
