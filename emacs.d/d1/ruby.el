;; ruby mode

(eval-after-load "ruby-mode"
  '(progn
     ;; Stop stealing my binding!
     (define-key ruby-mode-map (kbd "C-c C-c") nil)))

;; Setup all the various file types that should use ruby-mode
(setq ruby-file-types
      '("\.rake$"
       "\.gemspec$"
       "\.ru$"
       "Rakefile$"
       "Gemfile$"
       "Vagrantfile$"))

(dolist (ruby-file ruby-file-types)
  (add-to-list 'auto-mode-alist (cons ruby-file 'ruby-mode)))

(vendor 'ruby-end)
(require 'ruby-end)

(vendor 'rinari)
(require 'rinari)

(vendor 'rvm)
(require 'rvm)
;; (add-hook 'ruby-mode-hook
;;           (lambda () (rvm-activate-corresponding-ruby)))

(vendor 'rspec-mode)
(require 'rspec-mode)

(vendor 'pry)
(require 'pry)
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)
