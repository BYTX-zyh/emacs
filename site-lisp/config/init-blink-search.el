;;; init-blink-search.el --- blink-search config

;; Author: Bytx bytxzyh@gmail.com
;; URL:
;; version:
;; Package-Requires

;;; Commentary:

;;; License:

;;; Require:
(require 'blink-search)

;;; Codes:
(setq blink-search-enable-posframe t) ;; 浮动窗口搜索,需要posframe支持
(setq blink-search-common-directory '(("HOME" "~/" "~/.config/emacs")))
(setq blink-search-db-path "~/.config/emacs/plugFile/blink-search.db")

(provide 'init-blink-search)

;;; init-blink-search.el ends here
