
(add-hook 'emacs-lisp-mode-hook (lambda () (add-hook 'after-save-hook 'my/indent-buffer t t)))
