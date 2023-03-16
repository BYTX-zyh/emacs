(require 'avy)
;; avy提示字符
(setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
;; 表示avy提示范围 nil为当前Windows,t为当前frame,all-frames为所有frame的所有Windows
(setq avy-all-windows t)
;; 提示时间等待
(setq avy-timeout-seconds 0.8)
;; 全局快捷键
(global-set-key (kbd "C-:") 'avy-goto-char)

(one-key-create-menu
 "avy-jump"
 '(
   (("c" . "goto-char") . avy-goto-char)
   (("f" . "goto-char-2") . avy-goto-char-2)
   )
 t)
(provide 'init-avy)
