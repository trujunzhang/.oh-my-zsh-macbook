;; (defun org-convert-csv-table (beg end)
;; (interactive (list (mark) (point)))
;; (org-table-convert-region beg end ",")
;; )


(defun org-convert-csv-table (beg end)
                                        ; convert csv to org-table considering "12,12"
  (interactive (list (point) (mark)))
  (replace-regexp "\\(^\\)\\|\\(\".*?\"\\)\\|," (quote (replace-eval-replacement
                                                        replace-quote (cond ((equal "^" (match-string 1)) "|")
                                                                            ((equal "," (match-string 0)) "|")
                                                                            ((match-string 2))) ))  nil  beg end)


  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "s->") 'org-convert-csv-table)))

