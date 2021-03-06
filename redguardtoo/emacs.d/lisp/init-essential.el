;; -*- coding: utf-8; lexical-binding: t; -*-

;; Like "init-misc.el", the difference is this file is always loaded

(defun my-multi-purpose-grep (n)
  "Run different grep from N."
  (interactive "P")
  (cond
   ((not n)
    (counsel-etags-grep))
   ((= n 1)
    ;; grep references of current web component
    ;; component could be inside styled-component like `const c = styled(Comp1)`
    (let* ((fb (file-name-base buffer-file-name)))
      (when (string= "index" fb)
        (setq fb (file-name-base (directory-file-name (file-name-directory (directory-file-name buffer-file-name))))))
        (counsel-etags-grep (format "(<%s( *$| [^ ])|styled\\\(%s\\))" fb fb))))
   ((= n 2)
    ;; grep web component attribute name
    (counsel-etags-grep (format "^ *%s[=:]" (or (thing-at-point 'symbol)
                                                (read-string "Component attribute name?")))))
   ((= n 3)
    ;; grep current file name
    (counsel-etags-grep (format ".*%s" (file-name-nondirectory buffer-file-name))))
   ((= n 4)
    ;; grep js files which is imported
    (counsel-etags-grep (format "from .*%s('|\\\.js');?"
                                (file-name-base (file-name-nondirectory buffer-file-name)))))
   ((= n 5)
    ;; grep Chinese using pinyinlib.
    ;; In ivy filter, trigger key must be pressed before filter chinese
    (my-ensure 'pinyinlib)
    (let* ((counsel-etags-convert-grep-keyword
            (lambda (keyword)
              (if (and keyword (> (length keyword) 0))
                  (pinyinlib-build-regexp-string keyword t)
                keyword))))
      (counsel-etags-grep)))))

;; {{ message buffer things
(defun my-search-backward-prompt (n)
  "Search backward for N prompt.
Return the line beginning of prompt line."
  (let* (rlt
         (first-line-end-pos (save-excursion
                               (goto-char (point-min))
                               (line-end-position))))
    (save-excursion
      (while (and (> (line-beginning-position) first-line-end-pos)
                  (> n 0))
        (when (evilmi-prompt-line-p)
          (setq n (1- n))
          (setq rlt (line-beginning-position)))
        (forward-line -1)))
    rlt))

(defun my-erase-one-visible-buffer (buf-name &optional n)
  "Erase the content of visible buffer with BUF-NAME.
Keep latest N cli program output if it's not nil."
  (let* ((original-window (get-buffer-window))
         (target-window (get-buffer-window buf-name))
         beg)
    (cond
     ((not target-window)
      (message "Buffer %s is not visible!" buf-name))
     (t
      (select-window target-window)
      (let* ((inhibit-read-only t))
        (my-ensure 'evil-matchit-terminal)
        (when (and n (> n 0) (fboundp 'evilmi-prompt-line-p))
          ;; skip current prompt line
          (forward-line -2)
          (setq beg (my-search-backward-prompt n)))
        (cond
         (beg
          (delete-region (point-min) beg))
         (t
          (erase-buffer))))
      (select-window original-window)))))

(defun my-erase-visible-buffer (&optional n)
  "Erase the content of the *Messages* buffer.
N specifies the buffer to erase."
  (interactive "P")
  (cond
   ((null n)
    (my-erase-one-visible-buffer "*Messages*"))

   ((eq 1 n)
    (my-erase-one-visible-buffer "*shell*"))

   ((eq 2 n)
    (my-erase-one-visible-buffer "*Javascript REPL*"))

   ((eq 3 n)
    (my-erase-one-visible-buffer "*eshell*"))))

(defun my-erase-current-buffer (&optional n)
  "Erase current buffer even it's read-only.
Keep N cli output if it's not nil."
  (interactive "P")
  (my-erase-one-visible-buffer (buffer-name (current-buffer)) n)
  (goto-char (point-max)))
;; }}

;; {{ narrow region
(defun narrow-to-region-indirect-buffer-maybe (start end use-indirect-buffer)
  "Indirect buffer could multiple widen on same file."
  (if (region-active-p) (deactivate-mark))
  (if use-indirect-buffer
      (with-current-buffer (clone-indirect-buffer
                            (generate-new-buffer-name
                             (format "%s-indirect-:%s-:%s"
                                     (buffer-name)
                                     (line-number-at-pos start)
                                     (line-number-at-pos end)))
                            'display)
        (narrow-to-region start end)
        (goto-char (point-min)))
      (narrow-to-region start end)))

;; @see https://www.reddit.com/r/emacs/comments/988paa/emacs_on_windows_seems_lagging/
(unless *no-memory*
  ;; speed up font rendering for special characters
  (setq inhibit-compacting-font-caches t))

;; @see https://gist.github.com/mwfogleman/95cc60c87a9323876c6c
;; fixed to behave correctly in org-src buffers; taken from:
;; https://lists.gnu.org/archive/html/emacs-orgmode/2019-09/msg00094.html
(defun narrow-or-widen-dwim (&optional use-indirect-buffer)
  "If the buffer is narrowed, it widens.
 Otherwise, it narrows to region, or Org subtree.
If USE-INDIRECT-BUFFER is not nil, use `indirect-buffer' to hold the widen content."
  (interactive "P")
  (cond
   ((and (not use-indirect-buffer) (buffer-narrowed-p))
    (widen))

   ((and (not use-indirect-buffer)
         (eq major-mode 'org-mode)
         (fboundp 'org-src-edit-buffer-p)
         (org-src-edit-buffer-p))
    (org-edit-src-exit))

   ;; narrow to region
   ((region-active-p)
    (narrow-to-region-indirect-buffer-maybe (region-beginning)
                                            (region-end)
                                            use-indirect-buffer))

   ;; narrow to specific org element
   ((derived-mode-p 'org-mode)
    (cond
     ((ignore-errors (org-edit-src-code)) t)
     ((ignore-errors (org-narrow-to-block) t))
     ((ignore-errors (org-narrow-to-element) t))
     (t (org-narrow-to-subtree))))

   ((derived-mode-p 'diff-mode)
    (let* (b e)
      (save-excursion
        ;; If the (point) is already beginning or end of file diff,
        ;; the `diff-beginning-of-file' and `diff-end-of-file' return nil
        (setq b (progn (diff-beginning-of-file) (point)))
        (setq e (progn (diff-end-of-file) (point))))
      (when (and b e (< b e))
        (narrow-to-region-indirect-buffer-maybe b e use-indirect-buffer))))

   ((derived-mode-p 'prog-mode)
    (mark-defun)
    (narrow-to-region-indirect-buffer-maybe (region-beginning)
                                            (region-end)
                                            use-indirect-buffer))
   (t (error "Please select a region to narrow to"))))
;; }}

(defun my-swiper (&optional other-source)
  "Search current file.
If OTHER-SOURCE is 1, get keyword from clipboard.
If OTHER-SOURCE is 2, get keyword from `kill-ring'."
  (interactive "P")
  (let* ((keyword (cond
                   ((eq 1 other-source)
                    (cliphist-select-item))
                   ((eq 2 other-source)
                    (my-select-from-kill-ring 'identity))
                   ((region-active-p)
                    (my-selected-str)))))
    ;; `swiper--re-builder' read from `ivy-re-builders-alist'
    ;; more flexible
    (swiper keyword)))

(with-eval-after-load 'cliphist
  (defun cliphist-routine-before-insert-hack (&optional arg)
    (ignore arg)
    (my-delete-selected-region))
  (advice-add 'cliphist-routine-before-insert :before #'cliphist-routine-before-insert-hack))

;; {{ Write backup files to its own directory
;; @see https://www.gnu.org/software/emacs/manual/html_node/tramp/Auto_002dsave-and-Backup.html
(defvar my-binary-file-name-regexp
  "\\.\\(avi\\|wav\\|pdf\\|mp[34g]\\|mkv\\|exe\\|3gp\\|rmvb\\|rm\\|pyim\\|\\.recentf\\)$"
  "Is binary file name?")

(setq backup-enable-predicate
      (lambda (name)
        (and (normal-backup-enable-predicate name)
             (not (string-match-p my-binary-file-name-regexp name)))))

(let* ((backup-dir (expand-file-name "~/.backups")))
  (unless (file-exists-p backup-dir) (make-directory backup-dir))
  (setq backup-by-copying t ; don't clobber symlinks
        backup-directory-alist (list (cons "." backup-dir))
        delete-old-versions t
        version-control t  ;use versioned backups
        kept-new-versions 8
        kept-old-versions 4))

;; Donot make backups of files, not safe
;; @see https://github.com/joedicastro/dotfiles/tree/master/emacs
(setq vc-make-backup-files nil)
;; }}

(with-eval-after-load 'tramp
  (push (cons tramp-file-name-regexp nil) backup-directory-alist)

;; @see https://github.com/syl20bnr/spacemacs/issues/1921
;; If you tramp is hanging, you can uncomment below line.
;; (setq tramp-ssh-controlmaster-options "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  (setq tramp-chunksize 8192))


;; {{ GUI frames
;; Suppress GUI features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; Show a marker in the left fringe for lines not in the buffer
(setq indicate-empty-lines t)

(defun my-mini-ui ()
  "Minimum ui."
  ;; NO tool bar, scroll-bar
  (when window-system
    (scroll-bar-mode -1)
    (tool-bar-mode -1)
    (horizontal-scroll-bar-mode -1)))
(run-with-idle-timer 2 nil #'my-mini-ui)
;; }}

;; no menu bar
(menu-bar-mode -1)

(provide 'init-essential)
