(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)
(global-set-key (kbd "C-c f") 'my-org-finder)

(setq org-directory "~/org")
(setq org-agenda-files (list "~/org/scratch.org"))

(defun my-org-finder ()
  (interactive)
  (ido-find-file-in-dir "~/org/"))

(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

(setq org-publish-project-alist
      '(("website"
         :components ("posts" "assets"))

        ("posts"
         :base-directory "~/blog/org/posts"
         :base-extension "org"
         :publishing-directory "~/blog/jekyll/_p"
         :recursive t
         :publishing-function org-html-publish-to-html
         :with-toc nil
         :section-numbers nil
         :headline-levels 4
         :auto-preamble t
         :body-only t
         )

        ("assets"
         :base-directory "~/blog/org/assets"
         :base-extension "css\\|jpg\\|gif\\|png"
         :publishing-directory "~/blog/jekyll/assets"
         :recursive t
         :publishing-function org-publish-attachment)))
