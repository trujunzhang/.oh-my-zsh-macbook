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
    super-save))

(defun djzhang-packages/post-init-eww ()
   "docstring"
   (message "djzhang [post]: eww!"))

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
       (spacemacs/set-leader-keys "zb" 'spacemacs//djzhang-open-organizations-dir)
       ;; others
       (spacemacs/set-leader-keys "zc" 'spacemacs//djzhang-tern)
       (spacemacs/set-leader-keys "zv" 'spacemacs//djzhang-shell)
       (super-save-mode +1))))


