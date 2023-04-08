;;; awesome-tary

;;; Require
(require 'awesome-tray)

;;; Code
(awesome-tray-mode 1)               ;; 全局启动
(setq-default mode-line-format nil) ;; 禁用mode-line

(setq awesome-tray-separator "|") ;; 自定义分隔符

;; 显示的模块
(setq awesome-tray-active-modules
      '("belong"       ;; 类/函数状态
        "buffer-name"  ;; 缓冲区名称
        "file-path"    ;; 文件路径
        "mode-name"    ;; 主模式名称
        "last-command" ;; 最后使用的命令名称
        ))

(provide 'init-awesome-tray)
