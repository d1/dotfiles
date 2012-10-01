;; general

(global-set-key (kbd "C-m") 'newline-and-indent)

(global-set-key (kbd "M-g") `goto-line)

(global-set-key (kbd "C-x g") 'magit-status)

(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c t") 'toggle-transparency)

;; You know, like Readline.
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "M-/") 'hippie-expand)

;; Perform general buffer cleanup.
(global-set-key (kbd "C-c n") 'cleanup-buffer)

;; Jump to a definition in the current file
(global-set-key (kbd "C-x C-i") 'imenu)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-c f") 'find-file-in-project)

(global-set-key (kbd "C-c y") 'bury-buffer)
(global-set-key (kbd "C-c C-r") 'revert-buffer)

;; Movement
(global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window -1)))
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Start eshell or switch to it if it's active
(global-set-key (kbd "C-x m") 'eshell)

;; Use regex searches by default
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; Window-agnostic resizing
(global-set-key (kbd "M-<up>") 'move-window-border-up)
(global-set-key (kbd "M-<down>") 'move-window-border-down)
(global-set-key (kbd "M-<left>") 'move-window-border-left)
(global-set-key (kbd "M-<right>") 'move-window-border-right)
