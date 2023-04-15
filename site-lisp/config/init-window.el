;;; init-window.el --- 窗口相关设置

;; Filename: init-window.el
;; Description: windows and buffer manage
;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Version: 0.1
;; Keywords: window , buffer

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;;
;;

;;; Require:
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
