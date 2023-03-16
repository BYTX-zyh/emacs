
;; 启用which-key
(require 'which-key)
(which-key-mode)


;; which-key提示窗口的弹出位置
;; (which-key-setup-side-window-right-bottom)
(which-key-setup-side-window-bottom)
;; (setq which-key-popup-type 'side-window); 侧窗弹出提示

;; 修改常用key为中文描述
;; https://github.com/justbur/emacs-which-key#custom-string-replacement-options
(which-key-add-key-based-replacements "C-x C-f" "查找文件")

(provide 'init-emacs-which-key)
