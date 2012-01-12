;; load other, mode detailed configs
(load "d1/shell")

(vendor 'textmate)
(textmate-mode)
;;(setq textmate-find-files-command "git ls-tree --full-tree --name-only -r HEAD")

(vendor 'rinari)
(require 'rinari)

(vendor 'magit)
(require 'magit)

(vendor 'yasnippet)
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/vendor/yasnippet/snippets" "~/.emacs.d/d1/snippets"))
(yas/global-mode 1)

;; load ecb
;;(add-to-list 'load-path "~/.dotfiles/emacs.d/vendor/emacsmirror-ecb-54527e9")
;;(require 'ecb)
