; general
;;(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key "\M-g" `goto-line)
(global-set-key "\C-x g" 'magit-status)
;;(global-set-key "\C-c\C-c" 'comment-region)
;;(global-set-key "\C-c\C-z" 'uncomment-region)


(global-set-key (kbd "C-c t") 'toggle-transparency)
(global-set-key (kbd "C-c f") 'find-file-in-project)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;; Perform general cleanup.
(global-set-key (kbd "C-c n") 'esk-cleanup-buffer)

;; Jump to a definition in the current file. (Protip: this is awesome.)
(global-set-key (kbd "C-x C-i") 'imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c r") 'revert-buffer)

;; Window switching. (C-x o goes to the next window)
;; (windmove-default-keybindings) ;; Shift+direction
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window -1))) ;; back one
;;(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two

(global-set-key "\C-x\C-z" 'shell)
;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)


;;(global-set-key (kbd "C-h r") 'ri)
