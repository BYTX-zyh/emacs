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

;; 调用时显示的颜色
(setq hydra-temp-cursor-color "#e9e7ef")
(setq hydra-temp-hl-color "#bacac6")
;; windmove
(defhydra hydra-windmove(
                         :pre(progn
                               (set-cursor-color hydra-temp-cursor-color)
                               (set-face-background 'hl-line hydra-temp-hl-color)
                               )
                         :post  (load-theme 'lazycat-dark t)
                         :timeout 2)
  "using hjkl to move cursor"
  ("h" windmove-left  nil)
  ("j" windmove-down  nil)
  ("k" windmove-up    nil)
  ("l" windmove-right nil)
  ("q" nil "quit"))

;; buf-move
(defhydra hydra-buf-move(
                         :pre(progn
                               (set-cursor-color hydra-temp-cursor-color)
                               (set-face-background 'hl-line hydra-temp-hl-color)
                               )
                         :post  (load-theme 'lazycat-dark t)
                         :timeout 2)
  "using hjkl to move buffer"
  ("h" buf-move-left  nil)
  ("j" buf-move-down  nil)
  ("k" buf-move-up    nil)
  ("l" buf-move-right nil)
  ("q" nil "quit"))

;; window resize
(defhydra hydra-move-border(
                            :pre(progn
                                  (set-cursor-color hydra-temp-cursor-color)
                                  (set-face-background 'hl-line hydra-temp-hl-color)
                                  )
                            :post  (load-theme 'lazycat-dark t)
                            :timeout 2)
  "using hjkl to resize"
  ("h" move-border-left  nil)
  ("j" move-border-down  nil)
  ("k" move-border-up    nil)
  ("l" move-border-right nil)
  ("q" nil "quit"))

(defhydra hydra-kill-buffer-window(
                                   :pre(progn
                                         (set-cursor-color hydra-temp-cursor-color)
                                         (set-face-background 'hl-line hydra-temp-hl-color)
                                         )
                                   :post  (load-theme 'lazycat-dark t)
                                   :timeout 2)
  "
[_b_]uffer,[_w_]indow,[_o_]ther-window
"
  ("b" kill-this-buffer nil)
  ("w" delete-window)
  ("o" delete-other-windows nil)
  ("q" nil "quit"))

(defhydra hydra-split-window(
                             :pre(progn
                                   (set-cursor-color hydra-temp-cursor-color)
                                   (set-face-background 'hl-line hydra-temp-hl-color)
                                   )
                             :post  (load-theme 'lazycat-dark t)
                             :timeout 2)
  "h,v"
  ("v" split-window-vertically   nil)
  ("h" split-window-horizontally nil)
  ("q" nil "quit"))


;; hydra 主体
(defhydra hydra-windows(
                        :pre(progn
                              (set-cursor-color hydra-temp-cursor-color)
                              (set-face-background 'hl-line hydra-temp-hl-color)
                              )
                        :post  (load-theme 'lazycat-dark t)
                        :timeout 3)
  "
[_c_]ursor  光标移动
[_b_]buffer 窗口移动
[_r_]esize  窗口大小
[_k_]ill
[_s_]plit
"
  ("c" hydra-windmove/body    :exit t)        ;; windmove
  ("b" hydra-buf-move/body    :exit t)        ;; buf move
  ("r" hydra-move-border/body :exit t)        ;; window resize
  ("k" hydra-kill-buffer-window/body :exit t) ;; kill buffer and windows
  ("s" hydra-split-window/body :exit t)       ;; split
  ("q" nil "cancel"))

(provide 'init-window)
;;; init-window ends here
