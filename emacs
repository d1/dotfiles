;; Enable a backtrace when problems occur
;;(setq debug-on-error t)

;; Just enough to load the real config
(if (< emacs-major-version 24)
    (add-to-list 'load-path "~/.emacs-old.d")
  (add-to-list 'load-path "~/.emacs.d/lisp"))

(load "d1")
