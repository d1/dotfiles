;; load other, mode detailed configs
(load "d1/shell")
(load "d1/ruby")

(vendor 'textmate)
(textmate-mode)

(vendor 'smex)
(require 'smex)
(smex-initialize)

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

(vendor 'markdown-mode)
(eval-after-load "markdown-mode"
  '(progn
     (require 'longlines)
     (progn
       (add-hook 'markdown-mode-hook 'longlines-mode))))

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.page$" . markdown-mode))
