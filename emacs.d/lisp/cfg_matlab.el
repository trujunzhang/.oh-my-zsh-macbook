;;;
;;; https://sourceforge.net/projects/matlab-emacs/
;;;

;;;
;;; $ ln -s /Applications/MATLAB_R2017b.app/bin/matlab /usr/local/bin/matlab
;;;

(add-to-list 'load-path "~/.emacs.d/vendors/matlab-emacs")

(load-library "matlab-load")

;; Enable CEDET feature support for MATLAB code. (Optional)
(matlab-cedet-setup)


(custom-set-variables
 '(matlab-shell-command-switches '("-nodesktop -nosplash")))
(add-hook 'matlab-mode-hook 'auto-complete-mode)
(setq auto-mode-alist
    (cons
     '("\\.m$" . matlab-mode)
     auto-mode-alist))
