;; -*- lexical-binding: t; -*-
(require 'ansi-color)
(require 'facemenu)

(setq-default inhibit-splash-screen t
              make-backup-files nil
              tab-width 4
              indent-tabs-mode nil
              compilation-scroll-output t)

(setq treesit-language-source-alist
      '((rust "https://github.com/tree-sitter/tree-sitter-rust")
        (c++ "https://github.com/tree-sitter/tree-sitter-cpp")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (bash "https://github.com/tree-sitter/tree-sitter-bash")))

(defun whitespace-handling ()
  (interactive)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'emacs-lisp-mode 'whitespace-handling)
(add-hook 'c++-mode-hook 'whitespace-handling)
(add-hook 'c-mode-hook 'whitespace-handling)
(add-hook 'rust-mode-hook 'whitespace-handling)
(add-hook 'python-mode-hook 'whitespace-handling)
(add-hook 'markdown-mode-hook 'whitespace-handling)

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

(defun rc/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'rc/duplicate-line)

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

(defun my-frame-settings (frame)
  (select-frame frame)
  (set-frame-font "TX-02 14" nil t))
(add-hook 'after-make-frame-functions #'my-frame-settings)
(add-hook 'server-after-make-frame-hook #'my-frame-settings)
