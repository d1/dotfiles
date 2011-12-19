;; Just enough to load the real config
(add-to-list 'load-path "~/.emacs.d")
(load "d1")

;; Enable a backtrace when problems occur
;; (setq debug-on-error t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
