;; -*- lexical-binding: t; -*-
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(load "~/.emacs.rc/rc.el")
(load "~/.emacs.rc/misc-rc.el")
(load "~/.emacs.rc/org-rc.el")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(defun set-default-font ()
  (when (member "Iosevka" (font-family-list))
      (set-frame-font "Iosevka 16" t)))

(add-hook 'after-init-hook 'set-default-font)

(fset 'yes-or-no-p 'y-or-n-p)

;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))
;; (add-to-list 'initial-frame-alist '(fullscreen . fullboth))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(xterm-mouse-mode 1)

(global-set-key [down-mouse-3] 'imenu)
(global-set-key (kbd "C-c p") 'find-file-at-point)

(add-hook 'prog-mode-hook
          (lambda ()
          'display-line-numbers-mode 1
          (set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
          (set-face-attribute 'font-lock-type-face nil :slant 'italic)))

(setq visible-bell 0)
;; (setq display-line-numbers-type 'relative)
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
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

(eval-when-compile
  (require 'use-package-ensure)
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t))

(use-package smex
  :ensure t
  :bind (("M-x" . 'smex)
	     ("M-X" . 'smex-major-mode-commands))
  :config (smex-initialize))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1))

(use-package paredit
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode)
         (common-lisp-mode . enable-paredit-mode)
         (scheme-mode . enable-paredit-mode)))

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

(use-package helm
  :bind (("C-c h" . 'helm-command-prefix)
         ("C-x b" . 'helm-mini)))

(use-package company
  :config (add-hook 'after-init-hook 'global-company-mode))

(use-package yasnippet
  :config (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

(use-package yasnippet-snippets
  :after yasnippet)

(use-package move-text
  :bind (("M-p" . move-text-up)
	     ("M-n" . move-text-down)))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package which-key
  :config (which-key-mode))

(use-package rust-mode)
(use-package typescript-mode)
(use-package cmake-mode)
(use-package go-mode)

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package haskell-mode
  :hook ((haskell-mode . haskell-indent-mode)
         (haskell-mode . interactive-haskell-mode)
         (haskell-mode . haskell-doc-mode)
         (haskell-mode . hindent-mode))
  :config
  (setq haskell-process-type 'cabal-new-repl)
  (setq haskell-process-log t))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((rust-ts-mode rust-mode) .
                 ("rust-analyzer": initializationOptions (:check (:command "clippy"))))))

(use-package auctex
  :config
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)

  (global-set-key (kbd "C-c C-v") 'TeX-view)

  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer))

(use-package pdf-tools
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fitpage
                pdf-annot-activate-created-annotations t
                pdf-view-incompatible-modes '(display-line-numbers-mode)))

(use-package xterm-color
  :config (setq compilation-environment '("TERM=xterm-256color"))
  (advice-add 'compilation-filter :around
              (lambda (f proc string)
                (funcall f proc (xterm-color-filter string)))))

(use-package material-theme)
(require 'material-theme)
(load-theme 'material t)
