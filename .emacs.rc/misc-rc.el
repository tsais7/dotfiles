;;; ...  -*- lexical-binding: t -*-
(require 'ansi-color)

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
      confirm-kill-emacs #'y-or-n-p
      backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq-default c-basic-offset 4
              c-default-style '((java-mode . "java")
                                (awk-mode . "awk")
                                (other . "bsd")))

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

(setq treesit-language-source-alist
      '((rust "https://github.com/tree-sitter/tree-sitter-rust")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")))

(setq treesit-auto-install 'prompt)

(defun rc/buffer-file-name ()
  (if (equal major-mode 'dired-mode)
      default-directory
    (buffer-file-name)))

(defun rc/put-filename-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (rc/buffer-file-name)))
    (when filename
      (kill-new filename)
      (message filename))))

(defun rc/put-buffer-name-on-clipboard ()
  "Put the current buffer name on the clipboard"
  (interactive)
  (kill-new (buffer-name))
  (message (buffer-name)))

;;; Stefan Monnier <foo at acm.org>. It is the opposite of fill-paragraph
(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
        ;; This would override `fill-column' if it's an integer.
        (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)
