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

(provide 'init-ivy)
