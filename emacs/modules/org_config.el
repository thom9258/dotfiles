;; ============================================================================
;; Org Mode
;; ============================================================================
(use-package org)

(setq org-src-preserve-indentation t)
(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Dropbox/Org-Roam")
  :config
  (org-roam-setup)
  )

  (with-eval-after-load 'org-faces
    (dolist (face '(org-document-title
                   org-level-1
                   org-level-2
                   org-level-3))
     (set-face-attribute face nil :height 1.0)))

;; Insert Org-Roam node quickly without opening a buffer
(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (cons arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

;;(define-key evil-normal-state-map (kbd (concat LEADER "wi")) 'org-roam-node-insert)
(define-key evil-normal-state-map (kbd (concat LEADER "wi")) 'org-roam-node-insert-immediate)
(define-key evil-normal-state-map (kbd (concat LEADER "wg")) 'org-roam-graph)
(define-key evil-normal-state-map (kbd (concat LEADER "wf")) 'org-roam-node-find)
;; Shows backlinks for current buffer
(define-key evil-normal-state-map (kbd (concat LEADER "wt")) 'org-roam-buffer-toggle)

;; Max width for org images
(setq org-image-actual-width nil)
