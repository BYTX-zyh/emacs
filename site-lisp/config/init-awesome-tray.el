;;; init-awesome-tary.el --- awesome-tary 配置文件

;;; Require
(require 'awesome-tray)

;;; Code

(awesome-tray-mode 1)               ;; 全局启动
(setq-default mode-line-format nil) ;; 禁用mode-line
(setq awesome-tray-hide-mode-line t) ;; 使mode-line 变窄并在当前窗口活动时高亮显示
(setq awesome-tray-git-show-status t) ;; 在git模块显示当前文件状态
(setq awesome-tray-separator "")     ;; 自定义分隔符
(setq awesome-tray-location-format "(%l:%c)") ;; 自定location模块显示

;; 显示的模块
(setq awesome-tray-active-modules
      '("git"          ;; git状态
        "belong"       ;; 类/函数状态
        "buffer-name"  ;; 缓冲区名称
        "mode-name"    ;; 主模式名称
        "location"     ;; 显示当前光标位置
        "last-command" ;; 最后使用的命令名称
        ))

(provide 'init-awesome-tray)

;;; init-awesome-tray.el ends here
