(require 'bytx)

;; 中文英文自动转化工具
(dolist (hook (list
               'c-mode-hook
               'c++-mode-hook
               'c-mode-common-hook
               'org-mode-hook
               'elsip-mode-hook
               ))
  (add-hook 'post-self-insert-hook (
                                    lambda()
                                    (bytx-replace-char-list '(("（" . "(")
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
                                                              ("、" . "\\")
                                                              ("～" . "~")
                                                              ("！" . "!")
                                                              ("¥" . "$")
                                                              ("）" . ")"))))))


(provide 'init-bytx-function)
