;;; Personal functions

;;;; Window-position agnostic resizing
(defun window-horizontal-location()
  "Determine if selected window is on 'left' or 'right'"
  (let ((left-x (nth 0 (window-edges))))
    (if (eq 0 left-x) "left" "right")))

(defun window-vertical-location()
  "Determine if selected window is on 'top' or 'bottom'"
  (let ((top-y (nth 1 (window-edges))))
    (if (eq 0 top-y) "top" "bottom")))

(defvar border-move-amount 1 "Amount to move window borders by")

(defun move-window-border-left()
  "Enlarges or shirnks the current window so the border moves left"
  (interactive)
  (if (equal "left" (window-horizontal-location))
      (shrink-window-horizontally border-move-amount)
    (enlarge-window-horizontally border-move-amount)))

(defun move-window-border-right()
  "Enlarges or shirnks the current window so the border moves right"
  (interactive)
  (if (equal "left" (window-horizontal-location))
      (enlarge-window-horizontally border-move-amount)
    (shrink-window-horizontally border-move-amount)))

(defun move-window-border-up()
  "Enlarges or shirnks the current window so the border moves up"
  (interactive)
  (if (equal "top" (window-vertical-location))
      (shrink-window border-move-amount)
    (enlarge-window border-move-amount)))

(defun move-window-border-down()
  "Enlarges or shirnks the current window so the border moves down"
  (interactive)
  (if (equal "top" (window-vertical-location))
      (enlarge-window border-move-amount)
    (shrink-window border-move-amount)))


(defun edit-config ()
  (interactive)
  (find-file (expand-file-name "d1.el" user-emacs-directory)))

(defun reload-config ()
  (interactive)
  (load-file "~/.emacs"))


;; Quickly jump back and forth between matching parens/brackets
(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))))


(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))


;; Enable transparency
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 70))))
