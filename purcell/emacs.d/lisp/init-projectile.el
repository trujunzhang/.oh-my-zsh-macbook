;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;;   https://github.com/bbatsov/projectile

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Proj")

  (when (executable-find "rg")
    (setq-default projectile-generic-command "rg --files --hidden"))

  (with-eval-after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

  (maybe-require-package 'ibuffer-projectile))

(define-key evil-normal-state-map "p" 'projectile-command-map)


(provide 'init-projectile)
;;; init-projectile.el ends here