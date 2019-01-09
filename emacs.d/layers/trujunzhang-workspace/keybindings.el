(global-set-key (kbd "s-b") 'tide-jump-to-definition)
(global-set-key (kbd "s-[") 'tide-jump-back)


(global-set-key (kbd "s-/") 'comment-line)
(global-set-key (kbd "s--") 'next/fold-or-unfold)


;; buffers --------------------------------------------------------------------
(spacemacs/set-leader-keys
  "dn"    'bookmark-set
  "dj"    'bookmark-jump
  "dl"    'list-bookmarks)


