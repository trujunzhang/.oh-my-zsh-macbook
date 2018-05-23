
(defun my/sooheon-save-all()
  (interactive)
  (save-some-buffers t))


(defun my/prettier ()
  (interactive)
  (shell-command
   (format "%s --write %s"
           (shell-quote-argument (executable-find "prettier"))
           (shell-quote-argument (expand-file-name buffer-file-name))))
  (revert-buffer t t t))


;;
;; http://emacsredux.com/blog/2013/03/27/indent-region-or-buffer/
;;

(defun my/indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun my/indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (indent-buffer)
        (message "Indented buffer.")))))



(defun get-point (symbol &optional arg)
  "get the point"
  (funcall symbol arg)
  (point)
  )

(defun copy-thing (begin-of-thing end-of-thing &optional arg)
  "copy thing between beg & end into kill ring"
  (save-excursion
    (let ((beg (get-point begin-of-thing 1))
          (end (get-point end-of-thing arg)))
      (copy-region-as-kill beg end)))
  )

(defun paste-to-mark(&optional arg)
  "Paste things to mark, or to the prompt in shell-mode"
  (let ((pasteMe 
         (lambda()
           (if (string= "shell-mode" major-mode)
               (progn (comint-next-prompt 25535) (yank))
             (progn (goto-char (mark)) (yank) )))))
    (if arg
        (if (= arg 1)
            nil
          (funcall pasteMe))
      (funcall pasteMe))
    ))

(defun copy-word (&optional arg)
  "Copy words at point into kill-ring"
  (interactive "P")
  (copy-thing 'backward-word 'forward-word arg)
  ;;(paste-to-mark arg)
  )

(defun message-cursor()
  "message words at point from kill-ring"
  (interactive "P")
  (let (cursorWord
        (copy-word())
        ))
  (message cursorWord)
  )

(defun xx ()
  "print current word."
  (interactive)
  (let (word1)
    (setq word1 (thing-at-point 'word))
    (spacemacs/helm-project-smart-do-search word1)
    (message "%s" word1))
  ;; (message "%s" (thing-at-point 'word))
  )


;; SPC * runs the command spacemacs/helm-project-smart-do-search-region-or-symbol
;; (found in evil-normal-state-local-map), which is an interactive Lisp function in
;; ‘../init.el’.

;; It is bound to SPC *, SPC s P, M-m *, M-m s P.





