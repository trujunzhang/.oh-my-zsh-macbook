;;; funcs.el --- Python Layer functions File for Spacemacs
;;
;; Copyright (c) 2012-2021 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
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

(defun spacemacs//djzhang-open-ml-data_science()
  "Open pdfs."
  (interactive)
  (setq pdf-file "~/Documents/Doc-pdf/python/Python_Data_Science_Handbook.pdf")
  (find-file pdf-file)
  (message "open pdf: %s!" pdf-file))

(defun spacemacs//djzhang-open-ml-deep-learning()
  "Open pdfs."
  (interactive)
  (setq pdf-file "~/Documents/Doc-pdf/python/deep-learning-book-master/Split-pdf/Part I- 3 Probability and Information Theory.pdf")
  (find-file pdf-file)
  (message "open pdf: %s!" pdf-file))

(defun spacemacs//djzhang-open-ml-example()
  "Open pdfs."
  (interactive)
  (setq pdf-file "~/Documents/Doc-pdf/book-1/ML 机器学习：实用案例解析.pdf")
  (find-file pdf-file)
  (message "open pdf: %s!" pdf-file))

(defun spacemacs//djzhang-open-pdfs ()
   "Open pdfs."
   (interactive)
   (setq pdf-file "~/Documents/Doc-pdf/zweig/1965 米哈伊尔·亚历山大罗维奇·肖洛霍夫 苏联  静静的顿河(金人译，人民文学版).pdf")
   (find-file pdf-file)
   (message "open pdf: %s!" pdf-file))

(defun spacemacs//djzhang-open-zweig()
  "Open pdfs."
  (interactive)
  (setq pdf-file "~/Documents/Doc-pdf/zweig/古希腊罗马奴隶制.epub")
  (find-file pdf-file)
  (message "open pdf: %s!" pdf-file))

(defun spacemacs//djzhang-open-movies-dir ()
  (interactive)
  (dired "~/Movies")
  (message "djzhang: open Movies Folder!"))

(defun spacemacs//djzhang-open-downloads-dir ()
  (interactive)
  (dired "~/Downloads")
  (message "djzhang: open Downloads Folder!"))

(defun spacemacs//djzhang-open-organizations-dir ()
  (interactive)
  (dired "~/Documents/Organizations")
  (message "djzhang: open Organizations Folder!"))

(defun spacemacs//djzhang-open-flutter-dir ()
  (interactive)
  (dired "~/Documents/Organizations/__flutter")
  (message "djzhang: open flutter Folder!"))

(defun spacemacs//djzhang-tern ()
   "docstring"
   (interactive)
   (term "/bin/zsh"))

(defun spacemacs//djzhang-shell()
  "docstring"
  (interactive)
  (shell))
