;;; init-hook.el --- 用于存储一些hook

;;; Require
(require 'pretty-lambdada) ;; lambda 表达式优化
(require 'replace-char)    ;; 用于中英字符替换

;;; Code

;; pretty-lambdada 优化显示lammbdada
(dolist (hook (list
               'emacs-lisp-mode-hook))
  (add-hook hook #'pretty-lambda-mode))



(provide 'init-hook)

;;; init-hook.el ends here
