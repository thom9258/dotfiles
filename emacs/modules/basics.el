;; ============================================================================
;; Startup Basics
;; ============================================================================

;; Disable bars and other clutter
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1) 
(hl-line-mode)

(setq inhibit-startup-screen t)

;; Enable debugging of config
;; NOTE: Causes lots of uptrusive debug error messages when non fatal errors
;;       happen in plugins.
;;(setq debug-on-error t)

;; Count startup time of emacs
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Enable line numbers globally
(global-linum-mode t)

;; auto close bracket insertion. New in emacs 24
(electric-pair-mode 1)

;; Enable text wrap by default
(add-hook 'text-mode-hook 'visual-line-mode)

;; Move backup files to backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups/")))

;; Default tab sizes
(setq-default tab-width 4)

;; Function to rename current file
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let* ((name (buffer-name))
        (filename (buffer-file-name))
        (basename (file-name-nondirectory filename)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " (file-name-directory filename) basename nil basename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))


;; line at 81 character mode
(require 'whitespace)
(setq whitespace-line-column 81) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
