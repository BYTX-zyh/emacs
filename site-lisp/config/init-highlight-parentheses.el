;; 高亮括号
(require 'bytx-highlight-parentheses)
(add-hook 'find-file-hook 'highlight-parentheses-mode t)
;; 设置高亮颜色
(setq hl-paren-colors '("DarkOrange" "DeepSkyBlue" "DarkRed"))
(provide 'init-highlight-parentheses)
