;; ============================================================================
;; Evil Mode
;; ============================================================================

;; Better undo compatability
(use-package undo-fu)

(use-package evil
  ;; tweak evil's configuration before loading it
  :init      
  ;; This is optional since it's already set to t by default.
  (setq evil-want-integration t) 
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode))

(use-package evil-collection
  :after 'evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))
(evil-mode)
(evil-collection-init)

;; to work properly with evil-collection
(setq evil-want-keybinding nil)
;; no vim insert bindings
(setq evil-undo-system 'undo-fu)

(define-key global-map (kbd "<escape>") #'keyboard-escape-quit)

;;(with-eval-after-load 'evil-maps
;;  (define-key evil-motion-state-map (kbd "SPC") nil)
;;  (define-key evil-motion-state-map (kbd "RET") nil)
;;  (define-key evil-motion-state-map (kbd "TAB") nil)
;;)

;; Evil Leader Key
(setq LEADER "<SPC>")
;; TODO: Space is bound in some window modes, find a way to disable it!
;;(define-key sr-mode-map (kbd LEADER) nil)

;; Vim window movement
(define-key evil-normal-state-map (kbd (concat LEADER "h")) #'evil-window-left)
(define-key evil-normal-state-map (kbd (concat LEADER "j")) #'evil-window-down)
(define-key evil-normal-state-map (kbd (concat LEADER "k")) #'evil-window-up)
(define-key evil-normal-state-map (kbd (concat LEADER "l")) #'evil-window-right)

;; Window Creation Deletion
(define-key evil-normal-state-map (kbd (concat LEADER "sb")) #'split-window-below)
(define-key evil-normal-state-map (kbd (concat LEADER "sr")) #'split-window-right)
(define-key evil-normal-state-map (kbd (concat LEADER "sq")) #'delete-window)

;; Open Buffer list
(define-key evil-normal-state-map (kbd (concat LEADER "b")) 'list-buffers)

;; Quick file scrolling
(define-key evil-normal-state-map (kbd "J") "10j")
(define-key evil-normal-state-map (kbd "K") "10k")

;; Toggle directory tree
(define-key evil-normal-state-map (kbd (concat LEADER "t")) #'neotree-toggle)
(define-key evil-normal-state-map (kbd (concat LEADER "T")) #'neotree-show)
