(package-initialize)

(load "~/.emacs.rc/rc.el")
(load "~/.emacs.rc/misc-rc.el")

(rc/require 'use-package)
(require 'use-package)

(eval-and-compile
  (setq use-package-always-ensure t
	use-package-expand-minimally t))

(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-drectory-alist '(("." . "~/.emacs_saves")))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(set-frame-font "Iosevka 17")

;; ido
(ido-mode 1)
(ido-everywhere 1)

;; hooks
(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))
          
(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

;; (add-hook 'c++-mode-hook 'rc/set-up-whitespace-handling)


;; use-package
(use-package magit
  :bind (("C-x g" . magit-status)
	     ("C-x C-g" . magit-status)))

(use-package smex
  :bind (("M-x" . 'smex)
	     ("M-X" . 'smex-major-mode-commands))
  :config (smex-initialize))

(use-package zenburn-theme
  :defer t)

(use-package move-text
  :bind (("M-p" . move-text-up)
	     ("M-n" . move-text-down)))

(use-package which-key
  :config (which-key-mode))

(use-package company
  :config (global-company-mode t))

(use-package helm
  :bind (("C-c h" . 'helm-command-prefix)))





  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" default))
 '(package-selected-packages
   '(helm company which-key move-text zenburn-theme smex magit use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
