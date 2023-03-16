;;; ivy三件套

;; 引用包
(require 'ivy)
(require 'swiper)
(require 'counsel)

(ivy-mode) ;; 启动ivy
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy))) ;; 全部采用fuzzy搜索
(setq ivy-height 14) ;; ivy窗口的高度,即显示value-1个候选项(有一行ivy窗口)
(setq ivy-use-virtual-buffers t) ;; 补全文件路径时出现最近使用过的文件
(setq ivy-count-format "(%d/%d)") ;; ivy最左侧数目显示,表示 当前条目序号/所有匹配数
(setq enable-recursive-minibuffers t) ;; 允许minibuffer 递归嵌套
(setq ivy-wrap t) ;; 允许在ivy窗口中 C-n C-p循环


(one-key-create-menu
 "COUNSEL"
 '(
   (("y" . "yank-pop") . counsel-yank-pop) ;; 弹出一个窗口，显示当前的粘贴历史记录,可以通过选择/搜索的方式选择要粘贴的内容
   (("u" . "unicode-char") . counsel-unicode-char) ;; 查找unicode 字符
   (("v" . "set variable") . counsel-set-variable) ;; 设置变量
   )
 t)

(one-key-create-menu
 "IVY"
 '(
   (("r" . "恢复ivy状态") . ivy-resume)
   )
 t)

(global-set-key "\C-s" 'swiper) ;; 修改 `C-s' 为swiper
(global-set-key (kbd "C-c C-r") 'ivy-resume) ;; 恢复ivy状态

;; 一些原本键的替换
(global-set-key (kbd "M-x") 'counsel-M-x) ;; 替换原本的 `M-x'
(global-set-key (kbd "C-x C-f") 'counsel-find-file) ;; 替换原本的 `C-x\ C-f
(global-set-key (kbd "C-h f") 'counsel-describe-function) ;; 替换 `C-h\ f'
(global-set-key (kbd "C-h v") 'counsel-describe-variable) ;; 替换 `C-h\ v'
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol) ;; 替换 describe-symbol
(global-set-key (kbd "C-h l") 'counsel-find-library) ;; 替换原本的 find-library 查找emacs库函数
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

(provide 'init-ivy)
