;; Enable a backtrace when problems occur
;;(setq debug-on-error t)

;; Just enough to load the real config
(if (< emacs-major-version 24)
    (add-to-list 'load-path "~/.emacs.d")
  (add-to-list 'load-path "~/.emacs24.d"))

(load "d1")
