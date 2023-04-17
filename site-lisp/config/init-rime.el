;;;init-rime.el  --- rime输入法配置

;; Copyright (C) 2023 BYTX  <bytxzyh@gmail.com>

;; Filename: init-rime
;; Description: rime输入法配置
;; Author: BYTX <bytxzyh@gmail.com>
;; Keywords: rime

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
;;
;;
;;

;;; Change Log:

;;; Todo:

;;; Require:
(require 'rime)
(require 'posframe)
;;; Code:
(setq rime-librime-root "~/.config/emacs/site-lisp/librime/")
(setq rime-user-data-dir "~/.config/fcitx/rime")

(setq rime-posframe-properties
      (list :background-color "#333333"
            :foreground-color "#dcdccc"
            :font "WenQuanYi Micro Hei Mono-14"
            :internal-border-width 10))

(setq default-input-method "rime"
      rime-show-candidate 'posframe)
(provide 'init-rime)

;;; init-rime.el ends here
