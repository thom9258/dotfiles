;; TODO:
;; https://github.com/org-roam/org-roam

;; disable file type parsing in config
;;(let ((file-name-handler-alist nil))

;; Enable debugging of config
(setq debug-on-error t)

;; Disable bars and other shit
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1) 

;; Count startup time of emacs
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;; myPackages contains a list of package names
(defvar myPackages
  '(
    ;; Set up some better Emacs defaults
    better-defaults                 
    ;; Theme
    material-theme                  
    ;; Emacs vim mode tabs
    ;;evil-tabs ->evil tabs are evil!

    ;; pdf rendering
    pdf-tools
    ;;image-roll
    )
  )

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(pdf-tools-install)
(setq-default pdf-view-display-size 'fit-width)

;; Make pdf-tools default
;; for tex compilation also
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)
;; Make pdf-tools play well with "linum-mode" for some reason..
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

(unless (package-installed-p 'undo-fu)
  (package-install 'undo-fu))

;; Vim Bindings
(unless (package-installed-p 'evil)
  (package-install 'evil))
(define-key global-map (kbd "<escape>") #'keyboard-escape-quit)
;; to work properly with evil-collection
(setq evil-want-keybinding nil)
;; no vim insert bindings
(setq evil-undo-system 'undo-fu)
(evil-mode 1)

;;; Vim Bindings Everywhere else
(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))
(setq evil-want-integration t)
(evil-collection-init)

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)


(unless (package-installed-p 'use-package)
  (package-install 'use-package))


(setq org-src-preserve-indentation t)
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Dropbox/University/Org-Roam")
  :config
  (org-roam-setup)
  )

;; Load material theme
(load-theme 'material t)

;; Manually load custom org-inline-pdf package
(load-file "~/.emacs.d/manual-packages/org-inline-pdf.el/org-inline-pdf.el")
(add-hook 'org-mode-hook #'org-inline-pdf-mode)

;; ===================================
;; Basic Customization
;; ===================================

;; Vim window movement
(define-key evil-normal-state-map (kbd ",h") #'evil-window-left)
(define-key evil-normal-state-map (kbd ",j") #'evil-window-down)
(define-key evil-normal-state-map (kbd ",k") #'evil-window-up)
(define-key evil-normal-state-map (kbd ",l") #'evil-window-right)

(define-key evil-normal-state-map (kbd "J") "10j")
(define-key evil-normal-state-map (kbd "K") "10k")

;; TODO: Evil numbers does not work, ask reddit..
;; https://github.com/cofi/evil-numbers
;; "no number at point or until end of line"

;; (with-eval-after-load 'evil-maps
;; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode

(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)

(define-key evil-normal-state-map (kbd ",wt") 'org-roam-buffer-toggle)
(define-key evil-normal-state-map (kbd ",wf") 'org-roam-node-find)

;; Insert Org-Roam node quickly without opening a buffer
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(define-key evil-normal-state-map (kbd ",wI") 'org-roam-node-insert-immediate)
(define-key evil-normal-state-map (kbd ",wi") 'org-roam-node-insert)
(define-key evil-normal-state-map (kbd ",wg") 'org-roam-graph)

(define-key evil-normal-state-map (kbd ",b") 'list-buffers)

(with-eval-after-load 'evil-maps
;;  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil)
)

;; Max width for org images
(setq org-image-actual-width nil)
;;(setq shr-max-image-proportion 0.8)

;; Enable line numbers globally
(global-linum-mode t)
;; auto close bracket insertion. New in emacs 24

(electric-pair-mode 1)
;; Move backup files to backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

;; Enable text wrap by default
(add-hook 'text-mode-hook 'visual-line-mode)

;; Org mode link traversal
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "M-n") #'org-next-link)
  (define-key org-mode-map (kbd "M-p") #'org-previous-link))

;; Better Redo bind
;; TODO: Figure out how to overwrite emacs bindings in favor of vim binds
;; (global-unset-key (kbd "U"))
;; (global-unset-key (kbd "S-u"))
;; (global-unset-key (kbd "S-U"))
;; (define-key evil-normal-state-map (kbd "U") "C-r")

  (with-eval-after-load 'org-faces
    (dolist (face '(org-document-title
                   org-level-1
                   org-level-2
                   org-level-3))
     (set-face-attribute face nil :height 1.0)))
