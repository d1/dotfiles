;; Setup Tree-sitter
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; Remap major modes to tree-sitter version
(setq major-mode-remap-alist
      '((bash-mode . bash-ts-mode)
        (css-mode . css-ts-mode)
        (js2-mode . js-ts-mode)
        (json-mode . json-ts-mode)
        (ruby-mode . ruby-ts-mode)
        (typescript-mode . typescript-ts-mode)
	(yaml-mode . yaml-ts-mode)))

;; Install all grammars
;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))


(require 'smex)
(smex-initialize)

;;(require 'markdown-mode)
;;(require 'feature-mode)

(eval-after-load "ruby-mode"
  '(progn
     ;; Stop stealing my binding!
     (define-key ruby-mode-map (kbd "C-c C-c") nil)))

;; Setup all the various file types that should use ruby-mode
(defvar ruby-file-types
  '("\\.rake$"
    "\\.gemspec$"
    "\\.ru$"
    "Rakefile$"
    "Gemfile$"
    "Vagrantfile$"))

(dolist (ruby-file ruby-file-types)
  (add-to-list 'auto-mode-alist (cons ruby-file 'ruby-mode)))

;;(require 'rinari)
;;(require 'rspec-mode)
(setq rspec-use-rake-flag nil)

;;(require 'rvm)
;; (add-hook 'ruby-mode-hook
;;           (lambda () (rvm-activate-corresponding-ruby)))

;; (require 'pry)
;; (global-set-key [S-f9] 'pry-intercept)
;; (global-set-key [f9] 'pry-intercept-rerun)
