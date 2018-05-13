
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
