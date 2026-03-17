;;; ...  -*- lexical-binding: t -*-
(require 'ansi-color)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(eval-when-compile
  (require 'use-package-ensure)
  (setq use-package-always-ensure t)
  (setq use-package-expand-minimally t))

(load "~/.emacs.rc/rc.el")
(load "~/.emacs.rc/misc-rc.el")
(load "~/.emacs.rc/org-rc.el")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(defun rc/set-default-font ()
  (when (member "TX-02" (font-family-list))
    (set-frame-font "TX-02 12" t)))

(add-hook 'after-init-hook #'rc/set-default-font)


(setq-default inhibit-splash-screen t
              make-backup-files nil
              tab-width 4
              indent-tabs-mode nil
              compilation-scroll-output t)

(setq use-short-answers t
      kill-do-not-save-duplicates t
      scroll-preserve-screen-position t
      isearch-lazy-count t
      isearch-allow-scroll t
      visible-bell nil
      ring-bell-function #'ignore
      backup-directory-alist '(("." . "~/.emacs.d/backups")))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)

(recentf-mode 1)
(savehist-mode 1)
(xterm-mouse-mode 1)
(column-number-mode 1)
(global-hl-line-mode 1)
(global-auto-revert-mode 1)

(global-set-key (kbd "C-,") #'duplicate-dwim)
(global-set-key (kbd "C-x C-g") #'find-file-at-point)


(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")

(require 'dired-x)
(setq dired-omit-files (concat dired-omit-files "\\|^\\..+$")
      dired-dwim-target t
      dired-listing-switches "-alh --group-directories-first"
      dired-mouse-drag-files t)

(when (eq system-type "darwin")
  (setq insert-directory-program "gls"
        dired-use-ls-dired t))

(setq c-basic-offset 4
      c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (other . "bsd")))

(add-hook 'prog-mode-hook
          (lambda ()
            (display-line-numbers-mode 1)
            (setq display-line-numbers-width 3)
            (setq display-line-numbers-width-start 4)
            (face-remap-add-relative 'font-lock-keyword-face :slant 'italic)
            (face-remap-add-relative 'font-lock-type-face :slant 'italic)))

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))


(setq treesit-language-source-alist
      '((rust "https://github.com/tree-sitter/tree-sitter-rust")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")))

(setq treesit-auto-install 'prompt)


(use-package vertico
  :config
  (setq vertico-scroll-margin 0)
  (setq vertico-count 6)
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
         ("M-y"   . consult-yank-pop)
         ("M-s g" . consult-grep)
         ("M-s f" . consult-find)
         ("M-s p" . consult-project-buffer)
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
  :hook ((emacs-lisp-mode  . enable-paredit-mode)
         (lisp-mode        . enable-paredit-mode)
         (scheme-mode      . enable-paredit-mode))
  :bind  (:map paredit-mode-map ("M-s" . nil)))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
         ("C-\""        . mc/skip-to-next-like-this)
         ("C-:"         . mc/skip-to-previous-like-this)))

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



(use-package eglot
  :defer t
  :config
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode) .
                 ("rust-analyzer" :initializationOptions (:check (:command "clippy")))))
  (setq eglot-ignored-server-capabilites '(:documentFormattingProvider
                                           :documentRangeFormattingProvider
                                           :documentOnTypeFormattingProvider)))

(use-package rust-mode
  :hook (rust-mode . eglot)
  :init (setq rust-mode-treesitter-derive t))

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :config
  (setq markdown-header-scaling nil)
  (setq markdown-fontify-code-blocks-natively t)

  (set-face-attribute 'markdown-header-face nil :inherit 'default :height 1.0)
  (set-face-attribute 'markdown-header-face-1 nil :inherit 'default :height 1.0)
  (set-face-attribute 'markdown-header-face-2 nil :inherit 'default :height 1.0)
  (set-face-attribute 'markdown-header-face-3 nil :inherit 'default :height 1.0)
  (set-face-attribute 'markdown-header-face-4 nil :inherit 'default :height 1.0)
  (set-face-attribute 'markdown-header-face-5 nil :inherit 'default :height 1.0)
  (set-face-attribute 'markdown-header-face-6 nil :inherit 'default :height 1.0))



(use-package auctex
  :config
  (setq TeX-view-program-selection '((output-pdf "PDF Tools")))
  (setq TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view)))
  (setq TeX-source-correlate-start-server t)
  (global-set-key (kbd "C-c C-v") 'TeX-view)
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))

(use-package pdf-tools
  :magic ("%PDF" . pdf-view-mode)
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-tools-install t)
  (pdf-loader-install)
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

(use-package doom-themes
  :config
  ;; (load-theme 'doom-oceanic-next t)
   (load-theme 'doom-monokai-pro t)
  )
