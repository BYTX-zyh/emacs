(require 'init-accelerate) ;; 一些加速设置
(require 'init-font)       ;; 字体设置

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.6)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))

  ;; 让窗口启动更平滑
  (setq frame-inhibit-implied-resize t)
  (setq-default inhibit-redisplay t
                inhibit-message t)
  (add-hook 'window-setup-hook
            (lambda ()
              (setq-default inhibit-redisplay nil
                            inhibit-message nil)
              (redisplay)))

  ;; 抹掉插件启动输出
  (with-temp-message ""
    (require 'init-elpa) ;; elpa换源
    ;; (require 'mind-wave)         ;;; chat-gpt聊天
    (require 'init-screen)  ;; 屏幕大小设置
    (require 'init-generic) ;; 通用配置(一些各种小配置的集合)
    (require 'lazy-load)    ;; lazy-load模块
    (require 'bytx-one-key) ;; 键盘快捷键方式
    (require 'init-highlight-parentheses) ;; 高亮括号
    (require 'bytx)                       ;; 一些自定义内容
   ;; (require 'bytx-theme)
   ;; (bytx-theme-load-with-sunrise)
    (require 'init-themes)                ;; 自动加载随机主题
    (require 'init-ivy)                   ;; ivy
    (require 'init-session)      ;; session管理，用于保存与恢复
    (require 'init-indent)       ;; 缩进
    (require 'init-performance)  ;;
    (require 'init-fingertip)    ;; fingertip
    (require 'init-key)          ;; lazy-load加载的key设置
    (require 'init-lsp-bridge)   ;; lsp 配置
    (require 'init-blink-search) ;; 搜索插件
    (require 'init-auto-save)    ;; 文件停止编辑后自动保存
    (require 'init-org)          ;; org-mode设置
    (require 'init-sort-tab)     ;; 智能排序tab
    (require 'init-awesome-tray) 
    (require 'vimish-fold)
     #'(lambda()
         (require 'init-replace-char) ;; 中英文字符自动替换
         (require 'pretty-lambdada)   ;;;elisp lambda 表达式优化
         (require 'init-treesit)      ;; treesit 配置
         (require 'init-yasnippet)    ;; codesnip
         ;;      (require  'bytx-align)       ;;;对齐
         (require 'init-blink-search) ;; 搜索插件
         (require 'init-vterm)        ;; 终端模拟器
         (require 'init-avy)          ;; 光标跳转插件

         ;;      (require 'init-ivy-posframe) ;; ivy 浮动框架
         (require 'init-olivetti) ;; 居中显示
         ;;      (require 'init-sort-tab)     ;; 智能排序tab
         (require 'toggle-one-window) ;; 窗口切换
         (require 'rainbow-mode) ;; rainbow mode
       ;;  (require 'mind-wave) ;; chat
         )))

(provide 'init)

;;; todo
;; pretty-lambdada 自动显示
;; font: 为不同mode 添加不同的字体配置
;; lsp-bridge: 多功能跳转 keybind
;; init-mode : mode 绑定
;; Smart-align 匹配注释
;; undo tree
;; session 恢复
