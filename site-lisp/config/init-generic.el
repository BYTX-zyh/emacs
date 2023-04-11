;;; init-generic.el 一些配置的集合

;;; Code:

(setq gc-cons-threshold most-positive-fixnum) ;; 修改垃圾回收阈值为最大

;; 增加长行处理性能
(setq bidi-inhibit-bpa t)
(setq-default bidi-paragraph-direction 'left-to-right)

;; 增强emacs 与外部IO性能
(setq process-adaptive-read-buffering nil)
(setq read-process-output-max (* 1024 1024))

(fset 'yes-or-no-p 'y-or-n-p)   ;; 以 y/n代表 yes/no
(blink-cursor-mode -1)          ;; 指针不闪动
(transient-mark-mode 1)         ;; 标记高亮
(global-subword-mode 1)         ;; Word移动支持 FooBar 的格式
(setq use-dialog-box nil)       ;; 关闭弹出式窗口，采用minibuffer交互
(setq inhibit-startup-screen t) ;; 关闭启动页面 start screen
(setq initial-scratch-message "") ;; 关闭启动空白buffer, 这个buffer会干扰session恢复
(setq-default comment-style 'indent) ;; 设定自动缩进的注释风格
(setq ring-bell-function 'ignore)    ;; 关闭烦人的出错时的提示声
(setq default-major-mode 'text-mode) ;; 设置默认主模式为TEXT模式
(setq mouse-yank-at-point t)         ;; 粘贴于光标处,而不是鼠标指针处
(setq x-select-enable-clipboard t)   ;; 支持emacs和外部程序的粘贴
(setq split-width-threshold nil)     ;; 分屏的时候使用上下分屏
(setq confirm-kill-processes nil)    ;; 退出自动杀掉进程
(setq word-wrap-by-category t)       ;; 按照中文折行
(add-hook 'find-file-hook 'highlight-parentheses-mode t) ;增强的括号高亮
(setq frame-resize-pixelwise t) ;设置缩放的模式,避免Mac平台最大化窗口以后右边和下边有空隙，将窗口调整单位从字符修改为像素
;; 平滑地进行半屏滚动，避免滚动后recenter操作
(setq scroll-step 1
      scroll-conservatively 10000)

(setq auto-save-default nil)  ; 关闭emacs自动保存 不生成auto-save-list
(setq auto-save-list-file-prefix nil)

;; 修改recentf 目录
(setq recentf-save-file "~/.config/emacs/plugtemp/recentf")

;; 不显示 *scratch*
(defun remove-scratch-buffer ()
  (if (get-buffer "*scratch*")
      (kill-buffer "*scratch*")))
(add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Don't ask me when kill process buffer
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))

;; 相对行号设置
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(global-hl-line-mode 1) ;; 高亮当前行
;; (prefer-coding-system 'utf-8) ; 防止中文乱码

(setq custom-file (expand-file-name "custom.el" user-emacs-directory)) ; 创建custom.el使其不污染init.el

(provide 'init-generic)

;;; init-generic.el ends here
