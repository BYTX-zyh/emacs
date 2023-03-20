;;; 自动保存

(require 'auto-save)			      ;; require 包
(auto-save-enable)			      ;; 启动包
(setq auto-save-silent t)		      ;;静默保存
(setq auto-save-delete-trailing-whitespace t) ;; 自动删除末尾多余空格

;;; 如果需要对特殊后缀文件取消自动保存，采用如下示例：取消对gpg文件的自动保存
(setq auto-save-disable-predicates
      '((lambda ()
          (string-suffix-p
           "gpg"
           (file-name-extension (buffer-name)) t))))

(provide 'init-auto-save)
