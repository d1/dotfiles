(add-to-list 'load-path "~/.emacs-old.d/vendor")

(setq custom-file "~/.emacs-old.d/d1/custom.el")
(load custom-file 'noerror)

(load "d1/global")
(load "d1/defuns")
(load "d1/bindings")
(load "d1/theme")
(load "d1/modes")
