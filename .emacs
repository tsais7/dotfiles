;; -*- lexical-binding: t; -*-
;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/") t)

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

;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))
;; (add-to-list 'initial-frame-alist '(fullscreen . fullboth))
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(xterm-mouse-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
;; (global-set-key [down-mouse-3] 'imenu)
(global-set-key (kbd "C-c p") 'find-file-at-point)
(global-set-key (kbd "C-,") 'rc/duplicate-line)
(add-hook 'prog-mode-hook 'display-line-numbers-mode 1)

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

(defun whitespace-handling ()
  (interactive)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'emacs-lisp-mode 'whitespace-handling)
(add-hook 'c++-mode-hook 'whitespace-handling)
(add-hook 'c-mode-hook 'whitespace-handling)
(add-hook 'rust-mode-hook 'whitespace-handling)
(add-hook 'python-mode-hook 'whitespace-handling)
(add-hook 'markdown-mode-hook 'whitespace-handling)

(require 'dired-x)
(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)

(eval-when-compile
  (setq use-package-expand-minimally t))

(use-package paredit
  :ensure t
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode)
         (common-lisp-mode . enable-paredit-mode)
         (scheme-mode . enable-paredit-mode)))

(use-package multiple-cursors
  :ensure t
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-\"" . mc/skip-to-next-like-this)
         ("C-:" . mc/skip-to-previous-like-this)))

(use-package magit
  :ensure t
  :config (setq magit-auto-revert-mode nil)
  :bind ("C-c m l" . magit-log))

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

(use-package helm
  :ensure t
  :bind (("C-c h" . 'helm-command-prefix)
         ("C-x b" . 'helm-mini)))

(use-package company
  :ensure t
  :config (add-hook 'after-init-hook 'global-company-mode))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package move-text
  :ensure t
  :bind (("M-p" . move-text-up)
	     ("M-n" . move-text-down)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package treemacs
  :ensure t
  :defer t)
(use-package evil
  :ensure t
  :defer t)
(use-package rust-mode
  :ensure t
  :defer t)
(use-package typescript-mode
  :ensure t
  :defer t)
(use-package cmake-mode
  :ensure t
  :defer t)
(use-package go-mode
  :ensure t
  :defer t)

(use-package markdown-mode
  :defer t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package haskell-mode
  :defer t
  :hook ((haskell-mode . haskell-indent-mode)
         (haskell-mode . interactive-haskell-mode)
         (haskell-mode . haskell-doc-mode)
         (haskell-mode . hindent-mode))
  :config
  (setq haskell-process-type 'cabal-new-repl)
  (setq haskell-process-log t))

(use-package eglot
  :defer t
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) .
                 ("rust-analyzer"
                  :initializationOptions (:check (:command "clippy"))))))

;; (add-hook 'c-mode-hook 'eglot-ensure)
;; (add-hook 'c++-mode-hook 'eglot-ensure)
;; (add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)

(use-package auctex
  :defer t
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

(use-package xterm-color
  :ensure t
  :config (setq compilation-environment '("TERM=xterm-256color"))
  (advice-add 'compilation-filter :around
              (lambda (f proc string)
                (funcall f proc (xterm-color-filter string)))))



(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox-dark-hard)
  )
