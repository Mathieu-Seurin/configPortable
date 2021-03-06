;; TOOLS
(defun indent-rigidly-n (n)
  "Indent the region, or otherwise the current line, by N spaces."
  (let* ((use-region (and transient-mark-mode mark-active))
         (rstart (if use-region (region-beginning) (point-at-bol)))
         (rend   (if use-region (region-end)       (point-at-eol)))
         (deactivate-mark "irrelevant")) ; avoid deactivating mark
    (indent-rigidly rstart rend n)))
(defun indent-rigidly-1 ()
  "Indent the region, or otherwise the current line, by 1 space."
  (interactive)
  (indent-rigidly-n 1))
(defun outdent-rigidly-1 ()
  "Indent the region, or otherwise the current line, by -1 space."
  (interactive)
  (indent-rigidly-n -1))

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c e") 'eval-and-replace)


(global-set-key (kbd "<backtab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
                (replace-match "")))))

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



;; PYTHON2 TOOLS
(defun py2-write-print ()
  "Small function that write print and put cursor inside parenthesis"
  (interactive)
  (insert "print \"\", ")
  (backward-char 3)
  )

(defun py2-write-rawInput ()
  "Small function that write a for"
  (interactive)
  (insert "raw_input()")
  )


(defun py2-write-for ()
  "Small function that write a for"
  (interactive)
  (insert "for i in range():\n    pass")
  (backward-char 11)
  )

(defun python-add-on ()
  "Add two things : default figure and default
enumerate"
  (interactive)
  (local-set-key [?\C-p] 'py2-write-print)
  (local-set-key [?\M-p] 'py2-write-rawInput)

  (local-set-key (kbd "C-é") 'py2-write-for)

  (lambda () (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4))
)


;; LUA TOOLS
(defun lua-write-print ()
  "Small function that write print and put cursor inside parenthesis"
  (interactive)
  (insert "print(\"\",)")
  (backward-char 3)
  )

(defun lua-write-for ()
  "Small function that write a for"
  (interactive)
  (insert "for i=1, do\n\nend")
  (backward-char 8)
  )

(defun lua-write-ioRead ()
  "Small function that write a for"
  (interactive)
  (insert "io.read()")
  )


(defun lua-add-on ()
  "Add two things : default figure and default
enumerate"
  (interactive)
  (local-set-key [?\C-p] 'lua-write-print)
  (local-set-key [?\M-p] 'lua-write-ioRead)
  (local-set-key (kbd "C-é") 'lua-write-for)
)


;; LATEX TOOLS
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
  (interactive)
  (local-set-key [?\C-p] 'latex-add-figure)
  (local-set-key (kbd "C-é") 'latex-add-enum)
  (local-set-key [?\M-p] 'latex-add-double-figure)
)
