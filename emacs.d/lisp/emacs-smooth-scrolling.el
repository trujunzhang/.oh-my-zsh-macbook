;; emacs-smooth-scrolling.el

;; Makes that otherwise horribly laggy mouse scrolling in emacs
;; much more bearable.
;; Note: And yes I know you aren't suppose to use the mouse when
;; inside emacs...but! it makes sense when casually browsing code
;; while using a decent touchpad.

;; * Scrolling *
(setq scroll-step 1)
(setq scroll-conservatively 1000)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)

;; end-of-emacs-smooth-scrolling.el
