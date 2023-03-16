


(global-set-key (kbd "M-o") 'ace-window) ;; 启动插件
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)) ;; 提示用字符

(defvar aw-dispatch-alist
  '((?x aw-delete-window "Delete Window")
    (?m aw-swap-window "Swap Windows")
    (?M aw-move-window "Move Window")
    (?c aw-copy-window "Copy Window")
    (?j aw-switch-buffer-in-window "Select Buffer")
    (?n aw-flip-window)
    (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
    (?e aw-execute-command-other-window "Execute Command Other Window")
    (?F aw-split-window-fair "Split Fair Window")
    (?v aw-split-window-vert "Split Vert Window")
    (?b aw-split-window-horz "Split Horz Window")
    (?o delete-other-windows "Delete Other Windows")
    (?T aw-transpose-frame "Transpose Frame")
    ;; ?i ?r ?t are used by hyperbole.el
    (?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.
Each action is a list of either:
  (char function description) where function takes a single window argument
or
  (char function) where function takes no argument and the description is omitted.")

(require 'ace-window)

(provide 'init-ace-window)
