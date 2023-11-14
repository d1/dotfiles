(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archive-priorities '(("melpa"  . 50)))
(package-initialize)


(defvar d1-packages
  '(solarized-theme
    ;;clojure-mode
    ;;clojure-test-mode
    ;;feature-mode
    js2-modepa
    markdown-mode
    ;;multi-term
    ;;nrepl
    paredit
    ;;rinari
    ;;rspec-mode
    ssh
    slime
    smex
    yaml-mode))

(let ((refreshed nil))
  (when (not package-archive-contents)
    (package-refresh-contents)
    (setq refreshed t))
  (dolist (pkg d1-packages)
    (when (and (not (package-installed-p pkg))
             (assoc pkg package-archive-contents))
      (unless refreshed
        (package-refresh-contents)
        (setq refreshed t))
      (package-install pkg))))
