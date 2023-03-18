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
    ;; (require 'init-elpa)           ;; elpa换源
    (require 'init-screen)  ;; 屏幕大小设置
    (require 'init-generic) ;; 通用配置(一些各种小配置的集合)
    (require 'lazy-load)    ;; lazy-load模块
    (require 'bytx-one-key) ;; 键盘快捷键方式
    (require 'init-highlight-parentheses) ;; 高亮
    (require 'bytx)                       ;; 一些自定义内容
    (require 'init-bytx-function)         ;; 自定义内容
    (require 'init-themes)                ;; 自动加载随机主题
    (require 'init-session)	 ;; session管理，用于保存与恢复
(require 'init-treesit)      ;; treesit 配置
    (require 'init-fingertip)    ;; fingertip
    (require 'init-key)          ;; lazy-load加载的key设置
    (require 'init-lsp-bridge)   ;; lsp 配置
    (require 'init-blink-search) ;; 搜索插件
    (require 'init-beacon)       ;; 光标跳转提示
    (require 'init-auto-save)    ;; 文件停止编辑后自动保存
    (require 'init-yasnippet)    ;; codesnip
    (require 'init-org)          ;; org-mode设置
    (require 'init-sort-tab)	 ;; 智能排序tab

    ;; 在emacs闲置1s后启动的内容
    (run-with-idle-timer
     1 nil
     #'(lambda ()
         (require 'pretty-lambdada)  ;;;elisp lambda 表达式优化
         (require  'bytx-align)	      ;;;对齐
         ;;(require 'init-eldoc)	      ;; eldoc
         (require 'init-blink-search) ;; 搜索插件
         (require 'init-vterm)	   ;; 终端模拟器
         (require 'mind-wave)         ;;; chat-gpt聊天
         (require 'init-avy)              ;; 光标跳转插件
         (require 'init-ivy)           ;; ivy
         (require 'init-ivy-posframe) ;; ivy 浮动框架
         (require 'init-sort-tab)       ;; 智能排序tab
         ))
    ))
(provide 'init)

;;; todo config
;; smart-align 匹配注释
