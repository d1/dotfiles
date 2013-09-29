(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
            '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)


(defvar my-packages
       '(color-theme
	 color-theme-solarized
	 clojure-mode
	 clojure-test-mode
	 feature-mode
         markdown-mode
         multi-term
	 nrepl
	 paredit
	 rinari
         rspec-mode
         ruby-mode
         ruby-end
         ruby-block
         ssh
	 slime
         smex
         yaml-mode))

;; Todo: Really should 'sync' instead of just install ...
(dolist (pkg my-packages)
  (when (not (package-installed-p pkg))
    (package-install pkg)))
