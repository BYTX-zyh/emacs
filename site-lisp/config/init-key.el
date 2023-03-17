;;; 关于keybind的配置

;; Mac平台下交换 Option 和 Command 键
;; 设置大写锁定为 ctrl 键
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

;; 源自于ivy 三件套的键盘快捷键
(lazy-load-set-keys
 ;; 原生按键替换
 '(("M-x" . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("C-h v" . counsel-describe-variable)
   ("C-h f" . counsel-describe-function)
   ("C-s" . swiper)
   ("C-h l" . counsel-find-library)
   ;; ivy恢复
   ("C-c C-r" . ivy-resume)
   ;; ivy-immediate-done 表示使用当然输入值,而非默认选择的值
   ("C-<return>" . ivy-immediate-done)
   ))

(one-key-create-menu
 "COUNSEL"
 '(
   (("y" . "yank-pop") . counsel-yank-pop) ;; 弹出一个窗口，显示当前的粘贴历史记录,可以通过选择/搜索的方式选择要粘贴的内容
   (("u" . "unicode-char") . counsel-unicode-char) ;; 查找unicode 字符
   (("v" . "set variable") . counsel-set-variable) ;; 设置变量
   )
 t)

(global-set-key (kbd "C-c C-r") 'ivy-resume) ;; 恢复ivy状态 即上次使用的状态
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol) ;; 替换 describe-symbol
(global-set-key (kbd "C-h S") 'counsel-info-lookup-symbol) ;; 替换 `info-lookup-symbol'

;; 会话插件
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)

;; 相关command指令
(global-set-key (kbd "C-c c") 'counsel-compile)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c L") 'counsel-git-log)
(global-set-key (kbd "C-c k") 'counsel-rg)
(global-set-key (kbd "C-c m") 'counsel-linux-app)
(global-set-key (kbd "C-c n") 'counsel-fzf)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-c J") 'counsel-file-jump)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "C-c w") 'counsel-wmctrl)
(global-set-key (kbd "C-c b") 'counsel-bookmark)
(global-set-key (kbd "C-c d") 'counsel-descbinds)
(global-set-key (kbd "C-c o") 'counsel-outline)
(global-set-key (kbd "C-c t") 'counsel-load-theme)
(global-set-key (kbd "C-c F") 'counsel-org-file)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


;; avy 常用命令
(one-key-create-menu
 "avy-jump"
 '(
   (("t" . "goto char timer") . avy-goto-char-timer)
   (("c" . "goto char") . avy-goto-char)
   (("f" . "goto char-2") . avy-goto-char-2)
   (("" . "goto line") . avy-goto-line)
   (("w" . "goto word") . avy-goto-word-0)
   )
 t)

;; todo; goto char timer kbd

(provide 'init-key)
