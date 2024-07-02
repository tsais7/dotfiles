;; -*- lexical-binding: t; -*-
(package-initialize)

(load "~/.emacs.rc/rc.el")
(load "~/.emacs.rc/misc-rc.el")

(defun set-default-font ()
  (if (member "Iosevka" (font-family-list))
      (set-frame-font "Iosevka Fixed 14" nil t)))

(add-hook 'after-init-hook 'set-default-font)
(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(add-to-list 'initial-frame-alist '(fullscreen . fullboth))
;(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(use-package xterm-color
  :ensure)
(setq compilation-environment '("TERM=xterm-256color"))

(defun my/advice-compilation-filter (f proc string)
  (funcall f proc (xterm-color-filter string)))

(advice-add 'compilation-filter :around #'my/advice-compilation-filter)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(xterm-mouse-mode 1)
(column-number-mode 1)
(pixel-scroll-precision-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key [down-mouse-3] 'imenu)

;; (global-display-line-numbers-mode t)
(add-hook 'prog-mode-hook 'display-line-numbers-mode 1)

(setq x-select-enable-clipboard t)
(setq visible-bell 0)
(setq display-line-numbers-type 'relative)
(setq backup-drectory-alist '(("." . "~/.emacs_saves")))

(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

(add-hook 'c-mode-hook (lambda ()
                         (interactive)
                         (c-toggle-comment-style -1)))

(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq dired-dwim-target t)
(setq dired-listing-switches "-alh")

;;; company
(rc/require 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;;; yasnippet
(rc/require 'yasnippet)
(require 'yasnippet)

(yas-global-mode 1)
;; snippet collection
(rc/require 'yasnippet-snippets)

(eval-and-compile
  (setq use-package-always-ensure t
	    use-package-expand-minimally t))

(use-package smex
  :bind (("M-x" . 'smex)
	     ("M-X" . 'smex-major-mode-commands))
  :config (smex-initialize))

(use-package ido-completing-read+
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1))

(use-package helm
  :bind (("C-c h" . 'helm-command-prefix)
         ("C-x b" . 'helm-mini)))

(use-package move-text
  :bind (("M-p" . move-text-up)
	     ("M-n" . move-text-down)))

(use-package which-key
  :config (which-key-mode))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-\"" . mc/skip-to-next-like-this)
         ("C-:" . mc/skip-to-previous-like-this)))

(use-package magit
  :config (setq magit-auto-revert-mode nil)
  :bind ("C-c m l" . magit-log))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package rg)

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) .
                 ("rust-analyzer"
                  :initializationOptions
                  (:check (:command "clippy"))))))

(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)

;; Optional: install eglot-format-buffer as a save hook.
;; The depth of -10 places this before eglot's willSave notification,
;; so that that notification reports the actual contents that will be saved.
(defun eglot-format-buffer-on-save ()
  (add-hook 'before-save-hook #'eglot-format-buffer -10 t))
(add-hook 'go-mode-hook #'eglot-format-buffer-on-save)

(setq-default eglot-workspace-configuration
    '((:gopls .
        ((staticcheck . t)
         (matcher . "CaseSensitive")))))

(use-package markdown-mode
  :defer t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package elpy
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(use-package evil
  :defer t)

(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)

  (global-set-key (kbd "C-c C-v") 'TeX-view)

  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer))

(use-package pdf-tools
  :defer t
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fitpage
                pdf-annot-activate-created-annotations t
                pdf-view-incompatible-modes '(display-line-numbers-mode)))

(use-package rust-mode)

(use-package typescript-mode
  :defer t)
(use-package cmake-mode
  :defer t)
(use-package go-mode
  :defer t)

(use-package haskell-mode
  :defer t
  :hook ((haskell-mode . haskell-indent-mode)
         (haskell-mode . interactive-haskell-mode)
         (haskell-mode . haskell-doc-mode)
         (haskell-mode . hindent-mode))
  :config
  (setq haskell-process-type 'cabal-new-repl)
  (setq haskell-process-log t))

(use-package zenburn-theme
  :defer t)

(use-package gruber-darker-theme
  :defer t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("f079ef5189f9738cf5a2b4507bcaf83138ad22d9c9e32a537d61c9aae25502ef" "e27c9668d7eddf75373fa6b07475ae2d6892185f07ebed037eedf783318761d7" "ba4ab079778624e2eadbdc5d9345e6ada531dc3febeb24d257e6d31d5ed02577" "f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "f74e8d46790f3e07fbb4a2c5dafe2ade0d8f5abc9c203cd1c29c7d5110a85230" "bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" "2dc03dfb67fbcb7d9c487522c29b7582da20766c9998aaad5e5b63b5c27eec3f" "dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" default))
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(xterm-color expand-region pdf-tools auctex haskell-mode go-mode yasnippet-snippets rust-mode typescript-mode gruber-darker-theme multiple-cursors cmake-mode markdown-mode cmake-ide evil rg treemacs helm-gtags eglot ido-completing-read+ helm company which-key move-text zenburn-theme smex use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
