;;; init-ace-window.el --- ace-window 的配置内容

;;; require

(require 'ace-window)

;;; config

;; 'aw-keys' 表示ace-window插件提示用的字符
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; 允许 aw-dispatch-alist功能在少于两个window时生效
(setq aw-dispatch-always t)
;; 表示插件功能,按下 ace-window后的可选修饰键
(defvar aw-dispatch-alist
  '((?x aw-delete-window "删除当前窗口")
    (?m aw-swap-window "交换窗口")
    (?M aw-move-window "移动窗口")
    (?c aw-copy-window "拷贝窗口")
    (?j aw-switch-buffer-in-window "选择缓冲区")
    (?n aw-flip-window "选择上一个窗口")
    (?u aw-switch-buffer-other-window "在另一个窗口选择缓冲区")
    (?e aw-execute-command-other-window "Execute Command Other Window")
    (?F aw-split-window-fair "Split Fair Window")
    (?v aw-split-window-vert "Split Vert Window")
    (?b aw-split-window-horz "Split Horz Window")
    (?o delete-other-windows "删除其他窗口")
    (?T aw-transpose-frame "Transpose Frame")
    ;; ?i ?r ?t are used by hyperbole.el
    (?? aw-show-dispatch-help)))


(provide 'init-ace-window)
