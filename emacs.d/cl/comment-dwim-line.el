;; comment out current line
;; http://www.emacswiki.org/emacs/CommentingCode
(defun comment-dwim-line (&optional arg)
  "Replacement for the comment-dwim command.
        If no region is selected and current line is not blank and we are not at the end of the line,
        then comment current line.
        Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
  (interactive "*P")
  (comment-normalize-vars)
  ;;;  (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
  (if (not (region-active-p))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))

(global-set-key "\M-;" 'comment-dwim-line)
(global-set-key (kbd "s-/") 'comment-dwim-line)
