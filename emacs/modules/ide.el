;; ============================================================================
;; c / c++ IDE Features
;; https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/
;; ============================================================================

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

;; Tab completion instead of enter completion(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
(define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z") #'helm-select-action)

(which-key-mode)

;; C / C++
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq c-default-style "linux")
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)

;; Python lsp tutorial:
;; https://taingram.org/blog/emacs-lsp-ide.html
(add-hook 'python-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))
