

(if (display-graphic-p)
    (progn
      (setq initial-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120) ; chars
              (height . 32) ; lines
              ;;
              ))

      (setq default-frame-alist
            '(
              (tool-bar-lines . 0)
              (width . 120)
              (height . 32)
              ;;
              )))
  (progn
    (setq initial-frame-alist
          '(
            (tool-bar-lines . 0)))
    (setq default-frame-alist
          '(
            (tool-bar-lines . 0)))))
