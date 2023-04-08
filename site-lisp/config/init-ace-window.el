;;; init-ace-window.el --- ace-window 的配置内容

;;; Require
(require 'ace-window)

;;; Config
;; 'aw-keys' 表示ace-window插件提示用的字符
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; 允许 aw-dispatch-alist功能在少于两个window时生效
(setq aw-dispatch-always t)

;; 表示插件功能,按下 ace-window后的可选修饰键
(defvar aw-dispatch-alist
  '((?x aw-delete-window "Delete Window")
    (?m aw-swap-window "Swap Windows")
    (?M aw-move-window "Move Window")
    (?c aw-copy-window "Copy Window")
    (?j aw-switch-buffer-in-window "Select some Buffer")
    (?n aw-flip-window)
    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
    (?c aw-split-window-fair "Split Fair Window")
    (?v aw-split-window-vert "Split Vert Window")
    (?b aw-split-window-horz "Split Horz Window")
    (?o delete-other-windows "Delete Other Windows")
    (?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")


(provide 'init-ace-window)
