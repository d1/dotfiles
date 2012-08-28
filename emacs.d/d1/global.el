;; Global settings

;; Hide all the chrome
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

;; Keep the menu bar in OSX 'cause it looks nice
(if (not (equal system-type 'darwin))
    (menu-bar-mode -1)
  (menu-bar-mode 1))

(setq user-full-name "Dave Strock")
;;(setq user-mail-address "dave.strock@gmail.com")
(mouse-wheel-mode t)
(line-number-mode 1)
(global-linum-mode 1)
(column-number-mode 1)
(global-font-lock-mode t)
(show-paren-mode t)
(prefer-coding-system 'utf-8)

;; Accept just 'y' or 'n', instead of 'yes' or 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; Set C-k to kill the newline as well
(setq kill-whole-line t)

;; Shift + <arrow keys> to move around windows
(windmove-default-keybindings)

;; Tags & tabs
(setq tags-file-name "TAGS")
(setq-default tab-width 2)
(setq-default tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64)))
(setq-default indent-tabs-mode nil)

;; No need for trailing whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
;; End files with newline character
(setq require-final-newline 't)

;; Use a nice font by default
(set-face-attribute 'default (selected-frame) :family "Inconsolata")

;; Better spellcheck
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))

;; Make completion buffers disappear after 20 seconds.
;; (add-hook 'completion-setup-hook
;;   (lambda () (run-at-time 20 nil
;;     (lambda () (delete-windows-on "*Completions*")))))

;; For dup filenames, add parent dir to buffer name, instead of just appending integers
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; Put the name of current buffer in title bar
(setq frame-title-format
      '((:eval (if (buffer-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b")) " %* emacs"))

;; Don't make backups
(setq make-backup-files nil)

;;;;
;; Need to extract this to an environment-specific or host-specific file
(if (equal system-type 'cygwin)
    (set-face-attribute 'default (selected-frame) :height 120)
  (set-face-attribute 'default (selected-frame) :height 160))

(if (display-graphic-p)
    ;; Set transparency: 'alpha '(<active> [<inactive>])
    (set-frame-parameter nil 'alpha '(85 70)))

(if (equal system-type 'darwin)
    (progn
      (setq mac-allow-anti-aliasing t)
      (setq mac-command-modifier 'meta)
      (set-face-attribute 'default (selected-frame) :height 160)))
;;;

;; default window sizes
;;(set-frame-height (selected-frame) 37)
;;(set-frame-width (selected-frame) 100)
;;(set-frame-position (selected-frame) 50 40)

(server-start)
