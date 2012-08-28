;; load other, mode detailed configs
(load "d1/shell")
(load "d1/ruby")

(vendor 'textmate)
(textmate-mode)

(vendor 'magit)
(require 'magit)

(vendor 'yasnippet)
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/vendor/yasnippet/snippets" "~/.emacs.d/d1/snippets"))
(yas/global-mode 1)

;; Cucumber
(vendor 'feature-mode)
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; load ecb
;;(add-to-list 'load-path "~/.dotfiles/emacs.d/vendor/emacsmirror-ecb-54527e9")
;;(require 'ecb)
