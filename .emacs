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
(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

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

;; use-package

(use-package smex
  :bind (("M-x" . 'smex)
	     ("M-X" . 'smex-major-mode-commands))
  :config (smex-initialize))

(use-package rg
  :defer t)

(use-package zenburn-theme
  :defer t)

(use-package gruber-darker-theme
  :defer t)

(use-package move-text
  :bind (("M-p" . move-text-up)
	     ("M-n" . move-text-down)))

(use-package which-key
  :config (which-key-mode))

(use-package company
  :config (global-company-mode t))

(use-package helm
  :preface (require 'helm-config)
  :bind (("C-c h" . 'helm-command-prefix)
         ("C-x b" . 'helm-mini)))


(use-package eglot
  :config (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'c-mode-hook 'eglot-ensure))


(use-package treemacs
  :defer t)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(rc/require 'magit)
(setq magit-auto-revert-mode nil)

(rc/require 'evil)

(rc/require 'cmake-ide)

(rc/require 'rust-mode
            'typescript-mode
            'cmake-mode)

(rc/require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq dired-dwim-target t)
(setq dired-listing-switches "-alh")
  
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" "2dc03dfb67fbcb7d9c487522c29b7582da20766c9998aaad5e5b63b5c27eec3f" "dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" default))
 '(package-selected-packages
   '(rust-mode typescript-mode gruber-darker-theme multiple-cursors cmake-mode markdown-mode cmake-ide evil rg treemacs helm-gtags eglot ido-completing-read+ helm company which-key move-text zenburn-theme smex magit use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
