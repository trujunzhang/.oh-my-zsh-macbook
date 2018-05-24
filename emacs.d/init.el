
;; /This/ file (~init.el~) that you are reading
;; should be in this folder

;; Add .emacs.d/lisp to load-path
(setq dotfiles-lisp-dir
      (file-name-as-directory
       (concat (file-name-directory
                (or (buffer-file-name) load-file-name))
               "lisp")))
(add-to-list 'load-path dotfiles-lisp-dir)

(load "cfg_func.el")

;; Add .emacs.d/vendors to load-path
(setq vendors-lisp-dir
      (file-name-as-directory
       (concat (file-name-directory
                (or (buffer-file-name) load-file-name))
               "vendors")))

;;; (let ((default-directory  vendors-lisp-dir))
;;; (normal-top-level-add-to-load-path '("matlab-emacs" )))

;; First of all, resize the emacs window and position.
(load "cfg_gui.el")

;; Modify spacemacs-start-directory variable
;; This solution is better suited to "embed" Spacemacs into your own configuration.
;; Say you cloned Spacemacs in ~/.emacs.d/spacemacs/ then drop these lines in ~/.emacs.d/init.el:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
 (package-initialize)

(setq spacemacs-start-directory "~/.oh-my-zsh-macbook/lib/spacemacs/")
(load-file (concat spacemacs-start-directory "init.el"))

;; Emacs Cask Package manager
;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)


;; load my other configurations
(load "cfg_tide.el")
(load "cfg_typescript.el")
(load "cfg_default.el")
(load "cfg_javascript.el")
(load "cfg_lisp.el")
(load "cfg_matlab.el")
;; (load "cfg_w3m.el")
