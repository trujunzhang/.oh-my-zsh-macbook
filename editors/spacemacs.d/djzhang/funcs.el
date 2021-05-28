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

(defun spacemacs//djzhang-open-pdfs ()
   "Open pdfs."
   (interactive)
   (setq pdf-file "/Users/djzhang/Documents/Doc-pdf/zweig/1965 米哈伊尔·亚历山大罗维奇·肖洛霍夫 苏联  静静的顿河(金人译，人民文学版).pdf")
   (find-file pdf-file)
   (message "djzhang: open pdfs!"))


(defun spacemacs//djzhang-open-ml()
  "Open pdfs."
  (interactive)
  (setq pdf-file "/Users/djzhang/Documents/Doc-pdf/python/deep-learning-book-master/Split-pdf/Part I Applied Math and Machine Learning Basics.pdf")
  (find-file pdf-file)
  (message "djzhang: open pdfs!"))

(defun spacemacs/djzhang-open-wh ()
  (message "djzhang: open pdfs!"))
