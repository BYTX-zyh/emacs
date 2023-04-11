;;; init-highlight-parentheses --- 高亮括号

;;; Require
(require 'highlight-parentheses)

;;; Code:
(add-hook 'find-file-hook 'highlight-parentheses-mode t)
;; 设置高亮颜色
(setq hl-paren-colors '("DarkOrange" "DeepSkyBlue" "DarkRed"))

(provide 'init-highlight-parentheses)

;;; init-highlight-parentheses.el ends here
