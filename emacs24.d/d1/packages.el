(require 'package)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


;; el-get
(add-to-list 'load-path (expand-file-name "el-get/el-get" user-emacs-directory))
(setq el-get-user-package-directory
      (expand-file-name "el-get-init" user-emacs-directory))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))



(setq el-get-sources
      '((:name clojure-mode
               :type elpa
               :after (progn
                        (add-to-list 'auto-mode-alist '("\\.clj.*$" . clojure-mode))))))

(setq my-packages
      (append
       '(el-get
         feature-mode
         magit
         markdown-mode
         pry
         rinari
         rspec-mode
         ruby-block
         ruby-end
         ruby-mode
         slime
         smex
         yaml-mode)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
