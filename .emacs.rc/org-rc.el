(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(add-hook  'org-mode-hook #'visual-line-mode)

(setq org-agenda-files (list "~/org/personal.org"))

(defun my-org-finder ()
  (interactive)
  (ido-find-file-in-dir "~/org/"))

(global-set-key (kbd "C-c f") 'my-org-finder)

;; https://orgmode.org/worg/org-tutorials/org-jekyll.html
;; https://orgmode.org/worg/org-tutorials/org-publish-html-tutorial.html
(require 'ox-publish)
(setq org-publish-project-alist
      '(
        ("org-io"
         :base-directory "~/Blog/org-blog/org/posts/"
         :base-extension "org"
         :publishing-directory "~/Blog/org-blog/jekyll/_posts/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4
         :auto-preamble t
         :body-only t ;; Only export section between <body> </body>
         )
        ("org-static"
         :base-directory "~/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/Blog/org-blog/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-io" "org-static"))
        ))
