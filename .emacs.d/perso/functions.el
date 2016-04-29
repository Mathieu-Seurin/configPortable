(defun other-window-backward ()
"select other window clockwise"
(interactive)
(other-window -1)
)

(defun backward-kill-line ()
  "Kill backward from point to beginning of line"
  (interactive)
  (kill-line 0)
  )

(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (progn
       (message "Current line is copied.")
       (list (line-beginning-position) (line-beginning-position 2))))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	      (line-beginning-position 2)))))
