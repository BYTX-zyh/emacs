;;; init-performance.el --- Configure to improve performance


;; Disable garbage collection when entering commands.
;; 修改垃圾回收
(defun max-gc-limit ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun reset-gc-limit ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'max-gc-limit)
(add-hook 'minibuffer-exit-hook #'reset-gc-limit)

;; Improve the performance of rendering long lines.
;; 提高长行渲染能力
(setq-default bidi-display-reordering nil)

(provide 'init-performance)

;;; init-performance.el ends here
