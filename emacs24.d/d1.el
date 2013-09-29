(setq user-emacs-directory "~/.emacs24.d/")

(add-to-list 'load-path (expand-file-name "vendor" user-emacs-directory))

(setq custom-file (expand-file-name "d1/custom.el" user-emacs-directory))
(load custom-file 'noerror)

(load "d1/global")
(load "d1/packages")
(load "d1/theme")
(load "d1/functions")
(load "d1/bindings")
(load "d1/modes")
