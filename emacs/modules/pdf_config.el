;; ============================================================================
;; PDF Tools
;; ============================================================================

(unless (package-installed-p 'pdf-tools)
  (package-install 'pdf-tools))

(pdf-tools-install)
(setq-default pdf-view-display-size 'fit-width)
;; Make pdf-tools default (also for tex compilation)
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
      TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions
          #'TeX-revert-document-buffer)

;; Make pdf-tools play well with "linum-mode" for some reason..
(add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))

;; Manually load custom org-inline-pdf package
;;(load-file "~/.emacs.d/manual-packages/org-inline-pdf.el/org-inline-pdf.el")
(package-install-file "~/.emacs.d/manual-packages/org-inline-pdf.el/org-inline-pdf.el")
(add-hook 'org-mode-hook #'org-inline-pdf-mode)
