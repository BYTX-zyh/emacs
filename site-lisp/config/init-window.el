;;; init-window.el --- 窗口相关设置

;;; Require
(require 'hydra)
(require 'buffer-move)
(require 'move-border)

;;; Code:
(defhydra hydra-windows(:timeout 3)
  "
cursor |buffer |window|
-----------------------------------------------------------------
 ^ ^ _k_ ^ ^ | ^ ^ _d_ ^ ^ | ^ ^ _i_ ^ ^|
 _h_ ^+^ _l_ | _a_ ^+^ _f_ | _y_ ^+^ _o_|
 ^ ^ _j_ ^ ^ | ^ ^ _s_ ^ ^ | ^ ^ _u_ ^ ^|
分割窗口:[_c_]:上下分割,[_v_]:左右分割
删除:[_b_]uffer,[_w_]indow,o[_t_]ther window
"
  ;; windmove
  ("h" windmove-left  nil)
  ("j" windmove-down  nil)
  ("k" windmove-up    nil)
  ("l" windmove-right nil)
  ;; buf move
  ("a" buf-move-left  nil)
  ("s" buf-move-down  nil)
  ("d" buf-move-up    nil)
  ("f" buf-move-right nil)
  ;; window resize
  ("y" move-border-left  nil)
  ("u" move-border-down  nil)
  ("i" move-border-up    nil)
  ("o" move-border-right nil)
  ;; kill and delete
  ("w" delete-window        nil)
  ("t" delete-other-windows nil)
  ("b" kill-this-buffer     nil)

  ;; split and vsplit
  ("v" split-window-vertically   nil)
  ("c" split-window-horizontally nil)
  ;; quit
  ("q" nil "cancel"))


(provide 'init-window)
;;; init-window ends here
