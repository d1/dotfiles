
(vendor 'rinari)
(require 'rinari)

(vendor 'rvm)
(require 'rvm)
(add-hook 'ruby-mode-hook
          (lambda () (rvm-activate-corresponding-ruby)))
