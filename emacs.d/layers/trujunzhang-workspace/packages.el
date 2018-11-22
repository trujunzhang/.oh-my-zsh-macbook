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
    typescript-mode
    matlab-mode
    bm
    ))

(defun trujunzhang-workspace/init-matlab-mode()
  (use-package matlab-mode
    :defer t))

(defun trujunzhang-workspace/init-bm()
  (use-package bm
    :defer t))


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
