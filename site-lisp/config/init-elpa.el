;; 修改为清华镜像elpa
(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

;; ;;关闭软件包签名检测
;; (setq package-check-signature nil)

;; 初始化与刷新
(unless package-archive-contents
  (package-refresh-contents))

;; settings for use-package package
(unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))

 ;; use-package 常用设置
(setq use-package-always-ensure t
       use-package-always-defer t
       use-package-always-demand nil
       use-package-enpand-minimally t
       use-package-verbose t)

(provide 'init-elpa)
