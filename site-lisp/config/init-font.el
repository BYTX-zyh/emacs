;;; 为不同mode加载不同的字体设置
(defun load-font-setup(chinese-font-name english-font-name emacs-font-size)
	;;(let (
	;;	(emacs-font-size 15)
	;;	(chinese-font-name  "方正瘦金书简体")
       ;; (english-font-name "JetBrains Mono"))
        ;;    (when (display-grayscale-p)
             (set-frame-font (format "%s-%s" (eval english-font-name) (eval emacs-font-size)))
             (set-fontset-font (frame-parameter nil 'font) 'unicode (eval english-font-name))
;; 修正一部分中文字体
             (dolist (charset '(kana han symbol cjk-misc bopomofo))
               (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family (eval chinese-font-name))))
             )

(load-font-setup "方正瘦金书简体" "JetBrains Mono" 15)

;; This is hacking to fix Emacs 29 will decrease font after standby.
;; 用于修正 emacs 29版本导致的字号变化问题
(add-function :after after-focus-change-function #'(lambda()
						     (load-font-setup "方正瘦金书简体" "JetBrains Mono" 15)))

;; 为mode添加不同的字体设置
(dolist (hook (list
	       'c++-mode-hook
	       'emacs-lisp-mode-hook
	       'c-mode-common-hook
               'c-mode-hook))
  (add-hook hook #'lambda()
	    (load-font-setup "方正瘦金书简体" "JetBrains Mono" 15)))

(provide 'init-font)
