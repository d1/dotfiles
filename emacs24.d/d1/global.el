;; Global settings

;; Hide all the chrome
(setq inhibit-startup-message t)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(when (fboundp 'tooltip-mode) (tooltip-mode -1))

;; Keep the menu bar in OSX 'cause it looks nice
(if (and (fboundp 'menu-bar-mode) (not (eq system-type 'darwin)))
    (menu-bar-mode -1)
  (menu-bar-mode 1))

(setq user-full-name "Dave Strock")
;;(setq user-mail-address "dave.strock@gmail.com")
(setq-default cursor-type 'bar)
(mouse-wheel-mode t)
(line-number-mode 1)
(global-linum-mode 1)
(column-number-mode 1)
(global-font-lock-mode t)
(show-paren-mode t)

;; 80 character lines instead of 72
(setq fill-column 80)

;; Let me see *all* thats happening during eval-expression
(setq eval-expression-print-level nil)

;; Automatically reload files if they change on disk and not in Emacs
(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Turn on ido-mode
(ido-mode t)

;; Don't make backups
(setq make-backup-files nil)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; UTF-8 by default
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Accept just 'y' or 'n', instead of 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Set C-k to kill the newline as well
(setq kill-whole-line t)

;; Tags
(setq tags-file-name "TAGS")

;; Whitespace...
(setq tab-width 2
      indent-tabs-mode nil)

;; No need for trailing whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
;; End files with newline character
(setq require-final-newline t)

;; Use a nice font by default
(set-face-attribute 'default (selected-frame) :family "Inconsolata")

;; Better spellcheck
(setq ispell-program-name "aspell"
      ispell-list-command "list"
      ispell-extra-args '("--sug-mode=ultra"))

;; Make completion buffers disappear after 20 seconds.
;; (add-hook 'completion-setup-hook
;;   (lambda () (run-at-time 20 nil
;;     (lambda () (delete-windows-on "*Completions*")))))

;; Nice buffer names for duplicate named buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Put the name of current buffer in title bar
(setq frame-title-format
      '((:eval (if (buffer-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b")) " %* emacs"))

;;;;
;; Need to extract this to an environment-specific or host-specific file
(if (eq system-type 'cygwin)
    (set-face-attribute 'default (selected-frame) :height 120)
  (set-face-attribute 'default (selected-frame) :height 160))

(when (eq system-type 'darwin)
  (setq mac-allow-anti-aliasing t
        mac-command-modifier 'meta)
  (set-face-attribute 'default (selected-frame) :height 160))

(require 'server)
(unless (server-running-p)
  (server-start))
