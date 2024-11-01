;; -*- lexical-binding: t; -*-
(require 'ansi-color)
(require 'facemenu)
(setq-default inhibit-splash-screen t
      make-backup-files nil
      tab-width 4
      indent-tabs-mode nil
      compilation-scroll-output t)

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

(defun my-frame-settings (&optional frame)
  "Apply custom settings to FRAME or current frame."
  (with-selected-frame (or frame (selected-frame))
    (when (member "Iosevka" (font-family-list))
      (set-frame-font "Iosevka 14" nil t))))

(unless (daemonp)
  (my-frame-settings))

(add-hook 'after-make-frame-functions #'my-frame-settings)
(add-hook 'server-after-make-frame-hook #'my-frame-settings)
