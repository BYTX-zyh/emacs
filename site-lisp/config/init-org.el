(require 'bytx)
(setq org-startup-truncated t) ;; 长行换行
;;(setq org-agenda-restore-windows-after-quit t)
;;(setq org-agenda-restore-windows-after-submit nil)
;;(add-hook 'org-mode-hook 'org-hide-block-all)

                                        ;(setq org-startup-folded t)                  ; 默认全部折叠
(add-hook 'org-mode-hook #'visual-line-mode) ;; 为org添加长行折行

;; vaign,用于对齐表格
                                        ;(add-hook 'org-mode-hook #'valign-mode)

(require 'bytx-org-insert-image-from-clipboard) ;; 从剪切板复制图片

(require 'init-xenops) ;; 数学公式渲染

(provide 'init-org)
