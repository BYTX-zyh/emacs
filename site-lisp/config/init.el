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

  (setq my-config-dir "/Users/bytx/.config/emacs")
  ;; 抹掉插件启动输出
  (with-temp-message ""
    (require 'init-elpa) ;; elpa换源
    (require 'init-screen)  ;; 屏幕大小设置
    (require 'init-generic) ;; generic config
    (require 'lazycat-theme)
    (lazycat-theme-load-with-sunrise)

    (require 'lazy-load)    ;; lazy-load模块
    (require 'basic-toolkit)
    (require 'bytx)         ;; 一些自定义内容

    (require 'init-ivy)          ;; ivy
    (require 'init-indent)       ;; 缩进
    (require 'init-performance)  ;;
    (require 'init-fingertip)    ;; fingertip
    (require 'init-key)          ;; lazy-load加载的key设置
    (require 'init-lsp-bridge)   ;; lsp 配置
    (require 'init-auto-save)    ;; 文件停止编辑后自动保存
    ;; (require 'init-org)          ;; org-mode设置
    (require 'init-rime)

    (require 'init-awesome-tray)
    (require 'vimish-fold)
    ;; 在emacs闲置1s后启动的内容
    (run-with-idle-timer
     1 nil
     #'(lambda()
         (require 'init-highlight-parentheses) ;; 高亮括号

        ;; (require 'init-magit)
         (require 'init-hook) ;; 一些功能的hook绑定
         (require 'init-treesit)      ;; treesit 配置
         (require 'init-yasnippet)    ;; codesnip
         (require 'init-diff-hl)      ;; ui 配置 git gutter 侧边装订线
         ;;      (require  'bytx-align)       ;;;对齐
         (require 'init-blink-search) ;; 搜索插件
         (require 'init-avy)          ;; 光标跳转插件
         ;;(require 'init-olivetti) ;; 居中显示
         (require 'toggle-one-window) ;; 窗口切换
         (require 'rainbow-mode) ;; rainbow mode
         (require 'mind-wave) ;; chat
         (require 'init-eaf)


         (require 'init-session)      ;; session管理，用于保存与恢复
         (emacs-session-restore)
          (require 'init-sort-tab)     ;; 智能排序tab
         ))))

(provide 'init)

;;; todo
;; awesome-tray
;;    修改mode-line宽度
;;    添加新的module 表明其minor mode
;; pretty-lambdada
;;    改用ast检测？查看其实现原理
;; font: 为不同mode 添加不同的字体配置
;; lsp-bridge: 多功能跳转 keybind
;; Smart-align 匹配注释
;; undo tree
;; session 恢复
