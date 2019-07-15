;;; packages.el --- Dart Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Alexey Nabrodov <Averrin@gmail.com>
;; URL: https://github.com/averrin/dart-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq dart-layer-packages
  '(
    ;; flycheck
    flutter
    (dart-mode :location (recipe
      :fetcher github
      ;; :repo "sid-kurias/dart-mode"
      :repo "bradyt/dart-mode"
      )
    )
    (helm-dart :location (recipe
      :fetcher github
      :repo "sid-kurias/dart-mode"
      :files ("helm-dart.el")
      )
    )
    (company-dart
     :toggle (configuration-layer/package-usedp 'company)
     :location (recipe
      :fetcher github
      :repo "sid-kurias/company-dart"
      )
    )
  )
)

(defun dart-layer/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'dart-mode))

(defun dart-layer/init-helm-dart())

(defun dart-layer/init-flutter()
  (use-package flutter
    :after dart-mode
    :bind (:map dart-mode-map
                ("C-M-x" . #'flutter-run-or-hot-reload))
    :custom
    (flutter-sdk-path "/Users/djzhang/Documents/flutterSDK/"))
)

(defun dart-layer/init-company-dart ()
  (use-package company-dart
    :defer t
    :init (spacemacs|add-company-backends
            :backends company-dart
            :modes dart-mode)))

(defun dart-layer/init-dart-mode ()
  (use-package dart-mode
    :defer t
    :init
    (progn
      (add-hook 'dart-mode-hook #'(lambda () (modify-syntax-entry ?_ "w"))))
    :config
    (progn
        (spacemacs/set-leader-keys
        ;; (spacemacs/set-leader-keys-for-major-mode 'dart-mode
          "mj" 'dart-jump-to-defn
          "mf" 'dartfmt
          "mi" 'dart-imports
          "ms" 'dart-sort-members
          )

        (use-package helm-dart
          :config
          (progn
            (spacemacs/set-leader-keys
              "mq" 'helm-dart-quick-fix
              )
            )
          )
    )
    :custom
    (dart-sdk-path "/Users/djzhang/Documents/flutterSDK/bin/cache/dart-sdk/")
))

