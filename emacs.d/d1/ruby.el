;; ruby mode

(vendor 'rinari)
(require 'rinari)

(vendor 'rvm)
(require 'rvm)
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))

(vendor 'rspec-mode)
(require 'rspec-mode)

(vendor 'pry)
(require 'pry)
(global-set-key [S-f9] 'pry-intercept)
(global-set-key [f9] 'pry-intercept-rerun)
