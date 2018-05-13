  ;; Use zsh for default multi-term shell
  ;; (setq multi-term-program "/usr/bin/zsh")

  ;; Turn on visual-line-mode for Org-mode only
  ;; (add-hook 'org-mode-hook 'turn-on-visual-line-mode)

  ;; jr0cket: Remap multiple cursors to a pattern that is easier to remember
  (define-key global-map (kbd "C-c m c") 'mc/edit-lines)

  (global-set-key (kbd "s-/") 'comment-line)
  (global-set-key (kbd "s--") 'next/fold-or-unfold)

  (spacemacs/set-leader-keys
    "yi" 'yas/insert-snippet
    "me" 'evil-end-of-line
    "de" 'eval-buffer
    "ft" 'next/fold-or-unfold
    )

  ;; Auto-save on focus out
  (add-hook 'focus-out-hook 'my/sooheon-save-all)

  ;; global tern
  ;; (setq debug-on-error t)

  ;; (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  ;; (setq exec-path (append exec-path '("/usr/local/bin")))

  ;; (setq projectile-globally-ignored-directories
  ;;    (append '(
  ;;      ".git"
  ;;      ".svn"
  ;;      "out"
  ;;      "repl"
  ;;      "target"
  ;;      "venv"
  ;;      ".next"
  ;;      "node_modules"
  ;;     )
  ;;     projectile-globally-ignored-directories))

  ;;  (add-to-list 'projectile-globally-ignored-directories "node_modules")
