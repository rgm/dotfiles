(add-to-list 'exec-path "/usr/local/bin")

(defun rgm-init-package
    ()
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  (setq package-load-list '(all))
  (package-initialize)
  (unless package-archive-contents (package-refresh-contents)))

(defun rgm-load-evil
    ()
  (unless (package-installed-p 'evil) (package-install 'evil))
  (require 'evil)
  (evil-mode 1)
  (setq evil-toggle-key "M-e"))

(defun rgm-load-org
    ()
  (unless (package-installed-p 'org) (package-install 'org))
  (unless (package-installed-p 'org-evil) (package-install 'org-evil)))

(defun rgm-setup-colors
    ()
  (setq frame-background-mode 'dark)
  (set-face-attribute 'font-lock-comment-face nil :foreground "DimGray"))

(defun rgm-set-defaults
  ()
  (menu-bar-mode -1)
  (show-paren-mode 1))

(defun rgm-start
  ()
  (rgm-init-package)
  (rgm-load-evil)
  (rgm-load-org)
  (rgm-setup-colors)
  (rgm-set-defaults))

(rgm-start)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (org-evil evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -*- mode: Emacs-Lisp;-*-
;; vim:ft=lisp
