;;; 为不同mode加载不同的字体设置

;; 参数名称: 中文字体名称 英文字体名称 字体大小
(defun load-font-setup(chinese-font-name english-font-name emacs-font-size)
  (set-frame-font (format "%s-%s" (eval english-font-name) (eval emacs-font-size)))
  (set-fontset-font (frame-parameter nil 'font) 'unicode (eval english-font-name))
  ;; 修正一部分中文字体
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset (font-spec :family (eval chinese-font-name)))))

(load-font-setup "方正瘦金书简体" "JetBrains Mono" 15)

;; This is hacking to fix Emacs 29 will decrease font after standby.
;; 用于修正 emacs 29版本导致的字号变化问题
(add-function :after after-focus-change-function #'(lambda()
                                                 (load-font-setup "方正瘦金书简体" "JetBrains Mono" 15)))


(defun my-set-font-setup ()
  (interactive)
  (load-font-setup "方正瘦金书简体" "JetBrains Mono" 15))

(dolist (hook (list
               'c++-mode-hook
               'emacs-lisp-mode-hook
               'c-mode-common-hook
               'c-mode-hook))
  (add-hook hook #'my-set-font-setup))

(defun my-set-org-font-setup ()
  (interactive)
  (load-font-setup "等距更纱黑体 SC" "JetBrains Mono" 15))

(dolist (hook (list 'org-mode-hook))
  (add-hook hook #'my-set-org-font-setup))

;; (with-eval-after-load 'org
;;   (defun org-buffer-face-mode-variable ()
;;     (interactive)
;;     (make-face 'width-font-face)
;;     (set-face-attribute 'width-font-face nil :font "等距更纱黑体 SC 15")
;;     (setq buffer-face-mode-face 'width-font-face)
;;     (buffer-face-mode))
;;   (add-hook 'org-mode-hook 'org-buffer-face-mode-variable))
(provide 'init-font)
