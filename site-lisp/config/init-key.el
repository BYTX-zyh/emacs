;;; 关于keybind的配置

;; Mac平台下交换 Option 和 Command 键。
(when (featurep 'cocoa)
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta))

;; ace-window
(lazy-load-global-keys
 '(("M-o" . ace-window))
 "init-ace-window")

;(lazy-load-global-keys
; '(("" . avy-goto-char))
; "init-avy")



(provide 'init-key)
