
;; hide all the chrome.
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode nil)
(tooltip-mode nil)
;;(setq user-mail-address "dave.strock@gmail.com")
(setq user-full-name "Dave Strock")
(mouse-wheel-mode t)
(line-number-mode 1)
(column-number-mode 1)
(global-font-lock-mode t)
(show-paren-mode t)
(prefer-coding-system 'utf-8)


;; tags & tabs
(setq tags-file-name "TAGS")
(setq-default tab-width 2)
(setq-default tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64)))
(setq-default indent-tabs-mode nil)

(server-start)

;; no need for trailing whitespace
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))
;; end files with newline character
(setq require-final-newline 't)

;; use a nice font by default
(set-face-attribute 'default (selected-frame) :family "Inconsolata")


;; better spellcheck
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "list")
(setq ispell-extra-args '("--sug-mode=ultra"))


;; make completion buffers disappear after 20 seconds.
;; (add-hook 'completion-setup-hook
;;   (lambda () (run-at-time 20 nil
;;     (lambda () (delete-windows-on "*Completions*")))))

;; put the name of current buffer in title bar
(setq frame-title-format
  '((:eval (if (buffer-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b")) " %* emacs"))


;; don't clutter the workspace with a bunch of backups
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
(setq auto-save-default nil)


;;;;
;; Need to extract this to an environment-specific or host-specific file
(if (equal system-type 'cygwin)
    (set-face-attribute 'default (selected-frame) :height 120)
    (set-face-attribute 'default (selected-frame) :height 160))

(if (display-graphic-p)
    ;; Set transparency: 'alpha '(<active> [<inactive>])
    (set-frame-parameter nil 'alpha '(85 70)))

;; OS X Stuff @TODO: extract this
(if (equal system-type 'darwin)
    (setq mac-allow-anti-aliasing t))
(if (equal system-type 'darwin)
    (setq mac-command-modifier 'meta))
(if (equal system-type 'darwin)
    (set-face-attribute 'default (selected-frame) :height 160))


;; default window sizes
;;(set-frame-height (selected-frame) 37)
;;(set-frame-width (selected-frame) 100)
;;(set-frame-position (selected-frame) 50 40)
