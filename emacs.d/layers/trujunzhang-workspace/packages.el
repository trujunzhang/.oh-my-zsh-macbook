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
;;; Usefule:
;;; https://gist.github.com/trujunzhang/77a7393cc83f45426030b3828651f980
;;; https://gist.github.com/pratikborde/9dea191449f090e38378209b23d8eb30
;;; https://privatebin.net/?95b71760170ac5b4#T0rnilKc9UUPhcZFJcCuN1iXtS9UIVKAmTPXrYleDRk=


(defconst trujunzhang-workspace-packages
  '(
    ;;; For typescript
    tide
    typescript-mode
    web-mode
    (prettier-js :fetcher github :repo "prettier/prettier-emacs")
    ;;; For projects
    projectile
    ;;; For matlab
    ;; matlab-mode
    ))

;;; tide
;;; =================================
(defun trujunzhang-workspace/init-tide ()
  (use-package tide
    :defer t
    :commands (typescript/jump-to-type-def)
    :init
    (progn
      (evilified-state-evilify tide-references-mode tide-references-mode-map
        (kbd "C-k") 'tide-find-previous-reference
        (kbd "C-j") 'tide-find-next-reference
        (kbd "C-l") 'tide-goto-reference)
      (add-hook 'typescript-mode-hook 'tide-setup)
      ;; (push 'company-tide company-backends-typescript-mode)
      )
    :config
    (progn
      (spacemacs/declare-prefix-for-mode 'typescript-mode "mg" "goto")
      (spacemacs/declare-prefix-for-mode 'typescript-mode "mh" "help")
      (spacemacs/declare-prefix-for-mode 'typescript-mode "mn" "name")
      (spacemacs/declare-prefix-for-mode 'typescript-mode "mr" "rename")
      (spacemacs/declare-prefix-for-mode 'typescript-mode "mS" "server")
      (spacemacs/declare-prefix-for-mode 'typescript-mode "ms" "send")

      (defun typescript/jump-to-type-def()
        (interactive)
        (tide-jump-to-definition t))

      (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
        "gb" 'tide-jump-back
        "gt" 'typescript/jump-to-type-def
        "gu" 'tide-references
        "hh" 'tide-documentation-at-point
        "rr" 'tide-rename-symbol
        "Sr" 'tide-restart-server))))

;;; web-mode
;;; =================================
(defun trujunzhang-workspace/post-init-web-mode ()
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
  ;; FIXME -- this is not good!
  (add-hook 'web-mode-hook
            (lambda ()
              (when (and (buffer-file-name)
                         (string-equal "tsx" (file-name-extension (buffer-file-name))))
                (tide-setup)
                (flycheck-mode +1)
                (eldoc-mode +1)
                (when (configuration-layer/package-usedp 'company)
                  (company-mode-on))))
            )
  ;;; Format
  (add-hook 'web-mode-hook  'trujunzhang-workspace/my-web-mode-hook)
)

;;; typescript-mode
;;; =================================
(defun trujunzhang-workspace/init-typescript-mode ()
  (use-package typescript-mode
    :defer t
    :config
    (setq typescript-indent-level 2)
    (progn
      ;; (when typescript-fmt-on-save
        ;; (add-hook 'typescript-mode-hook 'typescript/fmt-before-save-hook))
      (spacemacs/set-leader-keys-for-major-mode 'typescript-mode
        "="  'typescript/format
        "sp" 'typescript/open-region-in-playground))))

;;; Typescript-mode
;;; =================================
(defun trujunzhang-workspace/post-init-typescript-mode()
  (message "info: [trujunzhang]: <post> typescript-mode")

  ;;; Auto save buffers.
  (add-hook 'focus-out-hook 'trujunzhang-workspace/sooheon-save-all)
  ;; (add-hook 'evil-insert-state-exit-hook 'trujunzhang-workspace/sooheon-save-all)
  )

;;; Prettier-js
;;; =================================
(defun trujunzhang-workspace/init-prettier-js ()
  (message "info: [trujunzhang]: <init> prettier-js")
  (use-package prettier-js
    :defer t)
  )

(defun trujunzhang-workspace/post-init-prettier-js ()
  (message "info: [trujunzhang]: <post> prettier-js")
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
  )

;;; Matlab-mode
;;; =================================
(defun trujunzhang-workspace/init-matlab-mode()
  (use-package matlab-mode
    :defer t)
  )

;;; Projectile
;;; =================================
(defun trujunzhang-workspace/post-init-projectile()
  (message "info: [trujunzhang]: <post> projectile!")

  ;;;  (setq projectile-project-search-path '("/Users/djzhang/Desktop/upwork-projects/CURRENT/python-ieatta-universal" "/Users/djzhang/Desktop/upwork-projects/CURRENT/python-politicl-universal"))

  ;; (setq projectile-enable-caching t)

  ;; (projectile-register-project-type 'yarn '("package.json")
                                    ;; :compile "yarn"
                                    ;; :test "npm test"
                                    ;; :run "npm start"
                                    ;; :test-suffix ".test")

)



;;; packages.el ends here
