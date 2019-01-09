;;; packages.el --- trujunzhang-workspace layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: djzhang <djzhang@djzhangs-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `trujunzhang-workspace-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `trujunzhang-workspace/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `trujunzhang-workspace/pre-init-PACKAGE' and/or
;;   `trujunzhang-workspace/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst trujunzhang-workspace-packages
  '(
    projectile
    typescript-mode
    ;; matlab-mode
    ;; bm
    ))

(defun trujunzhang-workspace/init-matlab-mode()
  (use-package matlab-mode
    :defer t))

(defun trujunzhang-workspace/init-bm()
  (use-package bm
         :ensure t
         :demand t

         :init
         ;; restore on load (even before you require bm)
         (setq bm-restore-repository-on-load t)


         :config
         ;; Allow cross-buffer 'next'
         (setq bm-cycle-all-buffers t)

         ;; where to store persistant files
         (setq bm-repository-file "~/.emacs.d/.bm-repository")

         ;; save bookmarks
         (setq-default bm-buffer-persistence t)

         ;; Loading the repository from file when on start up.
         (add-hook' after-init-hook 'bm-repository-load)

         ;; Saving bookmarks
         (add-hook 'kill-buffer-hook #'bm-buffer-save)

         ;; Saving the repository to file when on exit.
         ;; kill-buffer-hook is not called when Emacs is killed, so we
         ;; must save all bookmarks first.
         (add-hook 'kill-emacs-hook #'(lambda nil
                                          (bm-buffer-save-all)
                                          (bm-repository-save)))

         ;; The `after-save-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state.
         (add-hook 'after-save-hook #'bm-buffer-save)

         ;; Restoring bookmarks
         (add-hook 'find-file-hooks   #'bm-buffer-restore)
         (add-hook 'after-revert-hook #'bm-buffer-restore)

         ;; The `after-revert-hook' is not necessary to use to achieve persistence,
         ;; but it makes the bookmark data in repository more in sync with the file
         ;; state. This hook might cause trouble when using packages
         ;; that automatically reverts the buffer (like vc after a check-in).
         ;; This can easily be avoided if the package provides a hook that is
         ;; called before the buffer is reverted (like `vc-before-checkin-hook').
         ;; Then new bookmarks can be saved before the buffer is reverted.
         ;; Make sure bookmarks is saved before check-in (and revert-buffer)
         (add-hook 'vc-before-checkin-hook #'bm-buffer-save)


         :bind (("S-n" . bm-next)
                ("S-p" . bm-previous)
                ("S-b" . bm-toggle))
         )
  )


(defun trujunzhang-workspace/pre-init()
  (message "info: trujunzhang: pre init package")
  )

(defun trujunzhang-workspace/init()
  "Auto-save on focus out"
  (message "info: trujunzhang: init package")
  )

(defun trujunzhang-workspace/post-init()
  (message "info: trujunzhang: post init package")
  )

(defun trujunzhang-workspace/post-init-projectile()
;;;  (setq projectile-project-search-path '("/Users/djzhang/Desktop/upwork-projects/CURRENT/python-ieatta-universal" "/Users/djzhang/Desktop/upwork-projects/CURRENT/python-politicl-universal"))

  (message "info: trujunzhang: post init package for projectile!")
  (setq projectile-enable-caching t)
)

(defun trujunzhang-workspace/post-init-typescript-mode()
  (message "info: trujunzhang: post init typescript-mode")

  (add-hook 'focus-out-hook 'trujunzhang-workspace/sooheon-save-all)

  (add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'trujunzhang-workspace/prettier t t)))
  (add-hook 'react-mode-hook (lambda () (add-hook 'after-save-hook 'trujunzhang-workspace/prettier t t)))
  (add-hook 'typescript-mode-hook (lambda () (add-hook 'after-save-hook 'trujunzhang-workspace/prettier t t)))

  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
  )



;;; packages.el ends here
