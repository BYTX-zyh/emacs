;;; init-window.el --- 窗口相关设置

;;; Require
(require 'hydra)
(require 'buffer-move)

;;; Code:
(defhydra hydra-windows()
  "
^窗口相关操作^
^cursor^ ^buffer^
^^^^^^^^-----------------------------------------------------------------
_h_:左    _a_:左
_j_:下    _s_:下
_k_:上    _d_:上
_l_:右    _f_:右
"
  ;; windmove
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ;; buf move
  ("a" buf-move-left)
  ("s" buf-move-down)
  ("d" buf-move-up)
  ("f" buf-move-right)
  ;; quit
  ("q" nil "cancel"))

   ;; (("u" . "Enlarge Down") . (lambda () (interactive) (windresize-up-inwards '-1)))
   ;; (("i" . "Enlarge Up") . (lambda () (interactive) (windresize-down-inwards '-1)))
   ;; (("y" . "Enlarge Left") . (lambda () (interactive) (windresize-right-inwards '-1)))
   ;; (("o" . "Enlarge Right") . (lambda () (interactive) (windresize-left-inwards '-1)))
   ;; (("m" . "Shrink Down") . (lambda () (interactive) (windresize-up-inwards '1)))
   ;; (("," . "Shrink Up") . (lambda () (interactive) (windresize-down-inwards '1)))
   ;; (("n" . "Shrink Left") . (lambda () (interactive) (windresize-right-inwards '1)))
   ;; (("." . "Shrink Right") . (lambda () (interactive) (windresize-left-inwards '1)))
   ;; (("x" . "Outward Window") . outward-window)
   ;; (("c" . "Inward Window") . inward-window)
   ;; ((";" . "Kill Buffer") . kill-this-buffer)
   ;; ((":" . "Kill Other Windows") . delete-other-windows)
   ;; (("'" . "Kill Buffer And Window") . delete-current-buffer-and-window)
   ;; (("e" . "List Registers") . list-registers)
   ;; (("r" . "Remember Register") . frame-configuration-to-register)
   ;; (("t" . "Jump Register") . jump-to-register)
   ;; (("g" . "Split Horizontally") . split-window-horizontally)
   ;; (("v" . "Split Vertically") . split-window-vertically)

(provide 'init-window)
;;; init-window ends here
