;;;init-yasnippet.el  --- yassnipet配置内容

;; Copyright (C) 2023 BYTX  <bytxzyh@gmail.com>

;; Filename: init-yasnippet
;; Description: yassnipet配置内容
;; Author: BYTX <bytxzyh@gmail.com>
;; Keywords: yasnippet

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
(require 'yasnippet)
(require 'hydra)

;;; Code:

;; yas-snippet-dirs为emacs中检测snip目录的值。
(setq yas-snippet-dirs
      '(
        ;;(concat my-config-dir "site-lisp/snippets")
        "/Users/bytx/.config/emacs/site-lisp/snippets"
        ))

(yas-global-mode 1) ;; 全局启用

;; hydra-key
(defhydra hydra-yassnipet(
                          :timeout 1
                          :exit t)
  "
[_c_]reate new snip
[_v_]isit exist snip
"
  ("c" yas-new-snippet nil)
  ("v" yas-visit-snippet-file nil)
  ("q" nil "cancel")
  )

(provide 'init-yasnippet)

;;; init-yasnippet.el ends here
