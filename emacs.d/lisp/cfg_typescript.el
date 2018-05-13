
(add-hook 'js2-mode-hook (lambda () (add-hook 'after-save-hook 'my/prettier t t)))
(add-hook 'react-mode-hook (lambda () (add-hook 'after-save-hook 'my/prettier t t)))
(add-hook 'typescript-mode-hook (lambda () (add-hook 'after-save-hook 'my/prettier t t)))

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
