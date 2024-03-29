;;;init-key.el  --- 所有的keybind配置

;; Copyright (C) 2023 BYTX  <bytxzyh@gmail.com>

;; Filename: init-key
;; Description: 所有的keybind配置
;; Author: BYTX <bytxzyh@gmail.com>
;; Keywords: keybind , lazy-load

;; This file is not currently part of GNU Emacs.

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
;; 使用lazy-load与hydra进行的快捷键配置
;;
;;

;;; Change Log:

;;; Todo:

;;; Require:
(require 'hydra)

;;; Code:

;; Mac下交换option与command键
(when (featurep 'ns)
  (setq ns-command-modifier 'meta)
  (setq ns-alternate-modifier 'super))

;; (lazy-load-unset-keys
;;  '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)")

;; undo-tree
(lazy-load-global-keys
 '(
   ("C-/" . undo-tree-undo)             ;撤销
   ("C-?" . undo-tree-redo)             ;重做
   )
 "undo-tree")

;; 窗口管理
(lazy-load-global-keys
 '(
   ("M-p" . hydra-windows/body)
   )
 "init-window")

;; 已经加载的功能,
(lazy-load-set-keys
 '(("M-o" . hydra-yassnipet/body) ;; yassnipet
    ))


;; (one-key-create-menu
;;  "COUNSEL"
;;  '(
;;    (("y" . "yank-pop") . counsel-yank-pop) ;; 弹出一个窗口，显示当前的粘贴历史记录,可以通过选择/搜索的方式选择要粘贴的内容
;;    (("u" . "unicode-char") . counsel-unicode-char) ;; 查找unicode 字符
;;    (("v" . "set variable") . counsel-set-variable) ;; 设置变量
;;    )
;;  t)

;; (global-set-key (kbd "C-c C-r") 'ivy-resume) ;; 恢复ivy状态 即上次使用的状态
;; (global-set-key (kbd "<f1> o") 'counsel-describe-symbol) ;; 替换 describe-symbol
;; (global-set-key (kbd "C-h S") 'counsel-info-lookup-symbol) ;; 替换 `info-lookup-symbol'

;; 会话插件
;; (global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;; (global-set-key (kbd "C-c v") 'ivy-push-view)
;; (global-set-key (kbd "C-c V") 'ivy-pop-view)

;; 相关command指令
;; (global-set-key (kbd "C-c c") 'counsel-compile)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c L") 'counsel-git-log)
;; (global-set-key (kbd "C-c k") 'counsel-rg)
;; (global-set-key (kbd "C-c n") 'counsel-fzf)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (global-set-key (kbd "C-c w") 'counsel-wmctrl)
;; (global-set-key (kbd "C-c b") 'counsel-bookmark)
;; (global-set-key (kbd "C-c d") 'counsel-descbinds)
;; (global-set-key (kbd "C-c o") 'counsel-outline)
;; (global-set-key (kbd "C-c t") 'counsel-load-theme)
;; (global-set-key (kbd "C-c F") 'counsel-org-file)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


;; avy 常用命令
;; (one-key-create-menu
;;  "avy-jump"
;;  '(
;;    (("t" . "goto char timer") . avy-goto-char-timer)
;;    (("c" . "goto char") . avy-goto-char)
;;    (("f" . "goto char-2") . avy-goto-char-2)
;;    (("l" . "goto line") . avy-goto-line)
;;    (("w" . "goto word") . avy-goto-word-0)
;;    )
;;  t)

;;; ### Fingertip ###
;;; --- 结构化编程
;; (lazy-load-unset-keys
;;  '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)")
;;  fingertip-mode-map)                    ;卸载按键
;; (defvar fingertip-key-alist nil)
;; (setq fingertip-key-alist
;;       '(
;;         ;; 移动
;;         ("M-n" . fingertip-jump-left)
;;         ("M-p" . fingertip-jump-right)
;;         ;; 符号插入
;;         ("%" . fingertip-match-paren)   ;括号跳转
;;         ("(" . fingertip-open-round)    ;智能 (
;;         ("[" . fingertip-open-bracket)  ;智能 [
;;         ("{" . fingertip-open-curly)    ;智能 {
;;         (")" . fingertip-close-round)   ;智能 )
;;         ("]" . fingertip-close-bracket) ;智能 ]
;;         ("}" . fingertip-close-curly)   ;智能 }
;;         ("\"" . fingertip-double-quote) ;智能 "
;;         ("'" . fingertip-single-quote)  ;智能 '
;;         ("=" . fingertip-equal)         ;智能 =
;;         ("SPC" . fingertip-space)       ;智能 space
;;         ("RET" . fingertip-newline)     ;智能 newline
;;         ;; 删除
;;         ;;     ("M-o" . fingertip-backward-delete) ;向后删除
;;         ("C-d" . fingertip-forward-delete) ;向前删除
;;         ("C-k" . fingertip-kill)           ;向前kill
;;         ;; 包围
;;         ("M-\"" . fingertip-wrap-double-quote) ;用 " " 包围对象, 或跳出字符串
;;         ("M-'" . fingertip-wrap-single-quote) ;用 ' ' 包围对象, 或跳出字符串
;;         ("M-[" . fingertip-wrap-bracket)      ;用 [ ] 包围对象
;;         ("M-{" . fingertip-wrap-curly)        ;用 { } 包围对象
;;         ("M-(" . fingertip-wrap-round)        ;用 ( ) 包围对象
;;         ("M-)" . fingertip-unwrap)            ;去掉包围对象
;;         ;; 跳出并换行缩进
;;         ("M-:" . fingertip-jump-out-pair-and-newline) ;跳出括号并换行
;;         ;; 向父节点跳动
;;         ("C-j" . fingertip-jump-up)
;;         ))
;; (lazy-load-set-keys fingertip-key-alist fingertip-mode-map)

;; (require 'open-newline)


;;; lsp-bridge
;; lsp-bridge 内功能:
;; 选择下一个候选词 Alt+n/Down
;; 选择上一个候选词 Alt+p/Up
;; Alt + ,  acm-select-last 选择最后一个候选词
;; Alt + .  acm-select-first    选择第一个候选词
;;Ctrl + v  acm-select-next-page    向下滚动候选菜单
;;Alt + v   acm-select-prev-page    向上滚动候选菜单
;;Ctrl + m  acm-complete    完成补全
;;Return    acm-complete    完成补全
;;Tab   acm-complete    完成补全
;;Alt + h   acm-complete    完成补全
;;Alt + H   acm-insert-common   插入候选词共有部分
;;Alt + u   acm-filter  用 Overlay 进一步过滤候选词
;;Alt + d   acm-doc-toggle  开启或关闭候选词文档
;;Alt + j   acm-doc-scroll-up   向下滚动候选词文档
;;Alt + k   acm-doc-scroll-down 向上滚动候选词文档
;;Alt + l   acm-hide    隐藏补全窗口
;;Ctrl + g  acm-hide    隐藏补全窗口
;;Alt + 数字键  acm-complete-quick-access   快速选择候选词， 需要开启 acm-enable-quick-access 选项


;; (lazy-load-set-keys
;;  ;; 原生按键替换
;;  '(("M-x" . counsel-M-x)
;;    ("C-x C-f" . counsel-find-file)
;;    ("C-h v" . counsel-describe-variable)
;;    ("C-h f" . counsel-describe-function)
;;    ("C-s" . swiper)
;;    ("C-h l" . counsel-find-library)
;;    ;; ivy恢复
;;    ("C-c C-r" . ivy-resume)
;;    ;; ivy-immediate-done 表示使用当然输入值,而非默认选择的值
;;    ("C-<return>" . ivy-immediate-done)
;;    ))

;; todo; goto char timer kbd

(provide 'init-key)

;;; init-key.el ends here
