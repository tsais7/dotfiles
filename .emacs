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
  (when (member "TX-02" (font-family-list))
    (set-frame-font "TX-02 14" t)))
(add-hook 'after-init-hook 'set-default-font)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))
;; (add-to-list 'default-frame-alist '(fullscreen . fullboth))
;; (add-to-list 'initial-frame-alist '(fullscreen . fullboth))

(fset 'yes-or-no-p 'y-or-n-p)

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(xterm-mouse-mode 1)
(column-number-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(global-auto-revert-mode 1)
(global-completion-preview-mode 1)

(global-set-key (kbd "C-c p") 'find-file-at-point)

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode 1)
            (setq display-line-numbers-width-start 4)
            (setq display-line-numbers-type 'relative)
            (set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
            (set-face-attribute 'font-lock-type-face nil :slant 'italic)))

(setq visible-bell 0)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

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

;; (use-package smex
;;   :bind (("M-x" . 'smex)
;; 	     ("M-X" . 'smex-major-mode-commands))
;;   :config (smex-initialize))

;; (use-package ido-completing-read+
;;   :config
;;   (ido-mode 1)
;;   (ido-everywhere 1)
;;   ;; (ido-ubiquitous-mode 1)
;;   )

(use-package vertico
  :config
  (setq vertico-scroll-margin 0) 
  (setq vertico-count 5)
  (setq vertico-cycle t)
  (setq vertico-resize t)
  (vertico-mode))

(use-package marginalia
  :config
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-c r" . consult-imenu)
         ("M-s g" . consult-grep)
         ("M-s f" . consult-find)
         ("M-s o" . consult-outline)
         ("M-s l" . consult-line)))

(use-package embark
  :bind (("C-;" . embark-act)))

(use-package embark-consult)

(use-package corfu
  :config
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.2)
  (setq corfu-auto-prefix 2)
  (setq tab-always-indent 'complete)
  (setq corfu-preselect 'prompt)
  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode)
  (global-corfu-mode))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package paredit
  :hook ((emacs-lisp-mode . enable-paredit-mode)
         (lisp-mode . enable-paredit-mode)
         (common-lisp-mode . enable-paredit-mode)
         (scheme-mode . enable-paredit-mode))
  :bind  (:map paredit-mode-map
               ("M-s" . nil)))

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

(use-package typescript-mode)
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

(use-package rust-mode
  :init
  (setq rust-mode-treesitter-derive t)
  :hook
  ((rust-mode . eglot)
   (rust-mode . company-mode)))

(use-package eglot
  :hook
  (rust-mode . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs
               '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs '((rust-ts-mode rust-mode) .
                 ("rust-analyzer" :initializationOptions (:check (:command "clippy"))))))

(use-package auctex
  :config
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-source-correlate-start-server t)

  (global-set-key (kbd "C-c C-v") 'TeX-view)

  (add-hook 'TeX-after-compilation-finished-functions
            #'TeX-revert-document-buffer))

(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :init
  (defun my/pdf-tools-install ()
    (unless (package-installed-p 'pdf-tools)
      (package-install 'pdf-tools))
    (pdf-tools-install t)
    (pdf-loader-install))

  :config
  (my/pdf-tools-install)
  (setq-default pdf-view-display-size 'fitpage
                pdf-annot-activate-created-annotations t
                pdf-view-incompatible-modes '(display-line-numbers-mode)))

(use-package xterm-color
  :config (setq compilation-environment '("TERM=xterm-256color"))
  (advice-add 'compilation-filter :around
              (lambda (f proc string)
                (funcall f proc (xterm-color-filter string)))))

(use-package olivetti
  :config
  (setq olivetti-minimum-body-width 100))

(use-package gruber-darker-theme)
(use-package material-theme)

(load-theme 'gruber-darker t)
;; (load-theme 'material t)
