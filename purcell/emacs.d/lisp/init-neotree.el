;;; init-neotree.el --- neotree-mode -*- lexical-binding: t -*-
;;; Commentary:

;; See also init-neotree.el.

;;; Code:
;;; https://github.com/jaypei/emacs-neotree
;;; wiki:
;;;    https://www.emacswiki.org/emacs/NeoTree

(require-package 'neotree)

(setq-default neo-show-hidden-files t)

; (global-set-key [f8] 'neotree-toggle)
(define-key evil-normal-state-map "n" 'neotree-toggle)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let* ((project-dir (ffip-get-project-root-directory))
         (file-name (buffer-file-name)))
    (if project-dir
        (progn
          (neotree-dir project-dir)
          (neotree-find file-name))
      (message "Could not find git project root."))))
;; }}

(provide 'init-neotree)
;;; init-neotree.el ends here
