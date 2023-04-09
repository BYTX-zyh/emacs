;;; init-hook.el --- 用于存储一些hook

;;; Require
(require 'pretty-lambdada) ;; lambda 表达式优化
(require 'replace-char)    ;; 用于中英字符替换

;;; Code

;; pretty-lambdada 优化显示lammbdada
(dolist (hook (list
               'emacs-lisp-mode-hook))
  (add-hook hook #'pretty-lambda-mode))

;; replace-char
;; 中文英文自动转化工具
(dolist (hook (list
               'c-mode-hook
               'c++-mode-hook
               'c-mode-common-hook
               'org-mode-hook
               'elsip-mode-hook
               ))
  (add-hook 'post-self-insert-hook ( lambda()
                                     (bytx-replace-char-list '(
                                                               ("（" . "(")
                                                               ("，" . ",")
                                                               ("。" . ".")
                                                               ("；" . ";")
                                                               ("：" . ":")
                                                               ("‘" . "'")
                                                               ("“" . "\"")
                                                               ("【" . "[")
                                                               ("】" . "]")
                                                               ("「" . "{")
                                                               ("」" . "}")
                                                               ;; ("、" . "\\")
                                                               ("～" . "~")
                                                               ("！" . "!")
                                                               ("¥" . "$")
                                                               ("）" . ")"))))))

(provide 'init-hook)

;;; init-hook.el ends here
