;;; awesome-tary

;;; Require
(require 'awesome-tray)

;;; Code
(awesome-tray-mode 1);; 全局启动
(setq-default mode-line-format nil);; 禁用mode-line

(setq awesome-tray-active-modules '("location" "belong" "file-path" "mode-name" "last-command" "battery" "date"))

(provide 'init-awesome-tray)
