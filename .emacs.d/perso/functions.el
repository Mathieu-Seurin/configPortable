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

(defun write-print ()
  "Small function that write print and put cursor inside parenthesis"
  (interactive)
  (insert "print(\"\",)")
  (backward-char 3)
  )

(defun latex-add-figure ()
  (interactive)
  (insert "\\begin{figure}[ht]
  \\caption{}
  \\includegraphics[scale=1]{42.png}
  \\label{fig:lab}
\\end{figure}
")
  )

(defun latex-add-double-figure ()
  (interactive)
  (insert "\\begin{figure}[ht]
  \\centering
  \\subfloat[]{\\includegraphics[scale=0.5]{img1.jpg}}
  \\hfill
  \\subfloat[]{\\includegraphics[scale=0.5]{img2.png}}
  \\caption{}
  \\label{fig:double}
\\end{figure}
")
  )


(defun latex-add-enum ()
  (interactive)
  (insert "\\begin{enumerate}
\\item
\\item  
\\end{enumerate}
")
  )

(defun latex-addon ()
  "Add two things : default figure and default
enumerate"
  (global-set-key [?\C-p] 'latex-add-figure)
  (global-set-key (kbd "C-é") 'latex-add-enum)
  (global-set-key [?\M-p] 'latex-add-double-figure)

)
