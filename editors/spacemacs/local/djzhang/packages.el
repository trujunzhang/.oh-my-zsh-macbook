;;; packages.el --- djzhang layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2021 Sylvain Benner & Contributors
;;
;; Author: djzhang <djzhang@djzhangs-MacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `djzhang-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `djzhang/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `djzhang/pre-init-PACKAGE' and/or
;;   `djzhang/post-init-PACKAGE' to customize the package as it is loaded.

(defconst djzhang-packages
  '(
    ;; https://github.com/Davoodeh/dart-snippets    
    ;; dart-snippets
    ;; https://github.com/Exafunction/codeium.el
    (codeium :location (recipe
                          :fetcher github
                          :repo "Exafunction/codeium.el"))
    ;; https://github.com/emacs-php/jetbrains.el   
    jetbrains
    ;; https://github.com/bbatsov/super-save   
    ;; super-save
    ))

(defun djzhang/post-init-eww ()
  "docstring"
  (message "djzhang [post]: eww!"))

(defun djzhang/init-dart-snippets ()
  "docstring"
  (message "djzhang [init]: dart-snippets!")
  ;; (use-package dart-snippets
  ;;     :ensure t
  ;; )
)

(defun djzhang/init-codeium()
  "docstring"
  (message "djzhang [init]: codeium!")
;; we recommend using use-package to organize your init.el
(use-package codeium
    ;; if you use straight
    ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
    ;; otherwise, make sure that the codeium.el file is on load-path

    :init
    ;; use globally
    (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
    ;; or on a hook
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

    ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions
    ;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
    ;; an async company-backend is coming soon!

    ;; codeium-completion-at-point is autoloaded, but you can
    ;; optionally set a timer, which might speed up things as the
    ;; codeium local language server takes ~0.2s to start up
    (add-hook 'emacs-startup-hook
     (lambda () (run-with-timer 0.1 nil #'codeium-init)))

    ;; :defer t ;; lazy loading, if you want
    :config
    (setq use-dialog-box nil) ;; do not use popup boxes

    ;; if you don't want to use customize to save the api-key
    ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

    ;; get codeium status in the modeline
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
    ;;;; (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
    ;; alternatively for a more extensive mode-line
    ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

    ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
    (setq codeium-api-enabled
        (lambda (api)
            (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
    ;; you can also set a config for a single buffer like this:
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local codeium/editor_options/tab_size 4)))

    ;; You can overwrite all the codeium configs!
    ;; for example, we recommend limiting the string sent to codeium for better performance
    (defun my-codeium/document/text ()
        (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
    ;; if you change the text, you should also change the cursor_offset
    ;; warning: this is measured by UTF-8 encoded bytes
    (defun my-codeium/document/cursor_offset ()
        (codeium-utf8-byte-length
            (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
    (setq codeium/document/text 'my-codeium/document/text)
    (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))
)

(defun djzhang/init-jetbrains ()
  "docstring"
  (message "djzhang [init]: jetbrains!")
)

(defun djzhang/init-super-save ()
  "https://github.com/bbatsov/super-save"
  (message "djzhang [init]: super save!")
  (use-package super-save
     :ensure t
     :config
     (progn
       ;; bookmark
       (spacemacs/set-leader-keys "zb" 'bookmark-set)
       ;; pdf(ml) 
       (spacemacs/set-leader-keys "zq" 'spacemacs//djzhang-open-ml-data_science)
       (spacemacs/set-leader-keys "zw" 'spacemacs//djzhang-open-ml-deep-learning)
       (spacemacs/set-leader-keys "ze" 'spacemacs//djzhang-open-ml-example)
       ;; pdf
       (spacemacs/set-leader-keys "za" 'spacemacs//djzhang-open-pdfs)
       (spacemacs/set-leader-keys "zs" 'spacemacs//djzhang-open-zweig)
       ;; folder
       (spacemacs/set-leader-keys "zm" 'spacemacs//djzhang-open-movies-dir)
       (spacemacs/set-leader-keys "zn" 'spacemacs//djzhang-open-downloads-dir)
       (spacemacs/set-leader-keys "zj" 'spacemacs//djzhang-open-organizations-dir)
       (spacemacs/set-leader-keys "zk" 'spacemacs//djzhang-open-flutter-dir)
       ;; others
       (spacemacs/set-leader-keys "zc" 'spacemacs//djzhang-tern)
       (spacemacs/set-leader-keys "zv" 'spacemacs//djzhang-shell)
       (super-save-mode +1))))


