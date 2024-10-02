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

(defun rc/kill-autoloads-buffers ()
  (interactive)
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (string-match-p "-autoloads.el" name)
        (kill-buffer buffer)
        (message "Killed autoloads buffer %s" name)))))

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


(defun my-frame-settings (&optional frame)
  "Apply custom settings to FRAME or current frame."
  (with-selected-frame (or frame (selected-frame))
    (set-frame-font "Iosevka 14" nil t)))

(add-hook 'after-make-frame-functions #'my-frame-settings)

;; Apply settings to initial frame in non-daemon mode
(unless (daemonp)
  (my-frame-settings))

;; Apply settings to initial frame in daemon mode
(add-hook 'server-after-make-frame-hook #'my-frame-settings)
