 ;; -*- mode: Emacs-Lisp;-*-

;; todo
;; [ ] projectile
;; [ ] helm
;; [x] comment blocks - vim-commentary => evil-commentary
;; [ ] magit
;; [ ] sexp ... ? https://github.com/luxbock/evil-cleverparens
;; [ ] clojure
;; [ ] JS / JSX / typescript / ALE
;; [ ] gitgutter
;; [ ] snippets
;; [ ] org-mode

(tool-bar-mode 0)
(menu-bar-mode -1) ;; no menu ever
(add-to-list 'exec-path "/usr/local/bin")

(require 'package)
(package-initialize)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(defun rgm-load-evil
    ()
  (add-to-list 'load-path "~/.emacs.d/evil")
  (setq evil-toggle-key "C-`")
  (global-evil-leader-mode)
  (require 'evil)
  (require 'evil-cleverparens-text-objects)
  (evil-mode 1)
  ;; https://github.com/linktohack/evil-commentary
  (evil-commentary-mode))

(defun rgm-add-vimrc-keybindings
    ()
  ;; https://github.com/cofi/evil-leader
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "e" 'find-file
    "o" 'delete-other-windows))

(defun rgm-load-projectile
    ()
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map))

(rgm-load-evil)
(rgm-add-vimrc-keybindings)
(rgm-load-projectile)

(ivy-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("c3c0a3702e1d6c0373a0f6a557788dfd49ec9e66e753fb24493579859c8e95ab" default)))
 '(package-selected-packages
   (quote
    (evil-leader evil-cleverparens cider counsel-projectile ivy projectile magit)))
 '(safe-local-variable-values
   (quote
    ((cider-cljs-lein-repl . "(do (user/go) (user/cljs-repl))")
     (cider-refresh-after-fn . "reloaded.repl/resume")
     (cider-refresh-before-fn . "reloaded.repl/suspend")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
